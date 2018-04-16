//
//  WindowScrollViewSizeControl.swift
//  ReplaceScrollViewTest
//
//  Created by SeoGiwon on 04/09/2017.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

/// It defines functions to be called when the user interaction on a WindowScrollViewSizeControl occurs
protocol WindowScrollViewSizeControlProtocol {
    
    /**
     - parameters:
        - sizeControl: the size control that wants to move
        - delta: the point that the size control wants to move
        - currentCenterOffset: the difference between the point that the size control is currently placed
     upon and the size control's center value
     */
    func shouldMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint) -> Bool

    /**
     - parameters:
        - sizeControl: the size control that has moved
        - delta: the point that the size control has moved
     */
    func didMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint)
}

class WindowScrollViewSizeControl: UIView {
    
    enum ControlType: Int {
        case vertical, horizontal, both
    }

    @IBInspectable private var controlTypeInt: Int = 0 {
        didSet {
            if (controlTypeInt >= 0 && controlTypeInt <= 2) {
                controlType = ControlType(rawValue: controlTypeInt)!
            }
        }
    }

    var controlType = ControlType.vertical {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init(controlType: ControlType) {
        self.controlType = controlType
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    private var viewCenterXConstraint = NSLayoutConstraint()
//    private var viewCenterYConstraint = NSLayoutConstraint()
    @IBOutlet private weak var viewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var viewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var viewHeightConstraint: NSLayoutConstraint!
    
    var delegate: WindowScrollViewSizeControlProtocol?
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.backgroundColor = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        
        let pg = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.addGestureRecognizer(pg)
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        if let ctx = UIGraphicsGetCurrentContext() {
            
            drawEllipse(ctx: ctx, rect: rect)
            
            
        }
        
        
    }
    
    private func drawEllipse(ctx: CGContext, rect: CGRect) {
        
        ctx.saveGState()
        
        ctx.setStrokeColor(UIColor.black.cgColor)
        ctx.setLineWidth(0.3)
        ctx.setFillColor(UIColor.blue.cgColor)
        
        
        if (controlType == .horizontal) {
            
            let rectWidth = rect.width / 2.0
            let rectHeight: CGFloat = 20.0
            let theRect = CGRect(x: rect.midX - rectWidth / 2.0,
                                 y: rect.midY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            ctx.addPath(clipPath)
            
            ctx.drawPath(using: .fillStroke)
        } else if (controlType == .vertical) {
            
            let rectWidth: CGFloat = 20.0
            let rectHeight = rect.height / 2.0
            let theRect = CGRect(x: rect.midX - rectWidth / 2.0,
                                 y: rect.midY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            ctx.addPath(clipPath)
            
            ctx.drawPath(using: .fillStroke)
            
        } else {
            
            ctx.setStrokeColor(UIColor.clear.cgColor)
            ctx.setFillColor(UIColor.clear.cgColor)
            
            ctx.stroke(rect)
            ctx.fill(rect)
        }
        
        ctx.restoreGState()
    }
    
    /**
     Bind the size control's anchors to the given superview's. It is centered off from the given
     centerOff parameter.
    */
    func setupConstraints(superview: UIView, size: CGSize, offset: CGPoint) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        viewTopConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy:.equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset.y)
        viewLeftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy:.equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: offset.x)
        viewWidthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.width)
        viewHeightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.height)
        
        NSLayoutConstraint.activate([viewTopConstraint, viewLeftConstraint, viewWidthConstraint, viewHeightConstraint])
        
    }
    
    func setConstraintValues(values: [CGFloat]) {
        
        guard values.count == 4 else {
            print("setConstraintValues wrong values")
            return
        }
        
        viewLeftConstraint.constant = values[0]
        viewTopConstraint.constant = values[1]        
        viewWidthConstraint?.constant = values[2]
        viewHeightConstraint?.constant = values[3]
        
        UIView.animate(withDuration: 1.0) {
            self.layoutIfNeeded()
        }
    }
    
    
    /// Update the position(constraints) of the size control
    func update(offsetDelta: CGPoint) {
        
        viewLeftConstraint.constant += offsetDelta.x
        viewTopConstraint.constant += offsetDelta.y
        
    }
    
    func update(sizeDelta: CGSize) {
        
        viewWidthConstraint.constant += sizeDelta.width
        viewHeightConstraint.constant += sizeDelta.height
        
        self.setNeedsDisplay()
    }

    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self)
        var delta = CGPoint.zero
        
        guard let delegate = delegate else {
            print("delegate for WindowScrollViewSizeControl does not exist")
            return
        }
        
        // size control's delta value is trimmed depending on the control type
        switch controlType {
            case .vertical: delta = CGPoint(x: translation.x, y: 0)
            case .horizontal: delta = CGPoint(x: 0, y: translation.y)
            case .both: delta = translation
        }
        
        // ask the delegate if the size control's position update is allowed
        if delegate.shouldMove(sizeControl: self, delta: delta)
        {
            update(offsetDelta: delta)
            delegate.didMove(sizeControl: self, delta: delta)
        }
        
        sender.setTranslation(CGPoint.zero, in: self)
        self.layoutIfNeeded()
    }
}
