//
//  SplitView.swift
//  ReplaceScrollViewTest
//
//  Created by SeoGiwon on 04/08/2017.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

/**
    LayoutEditingView_Type1 is a view that has two views(splitViewAlpha, splitViewBeta, and
    one size control(sizeControlAlpha).
    |           |
    |           |
    |-----------|
    |           |
    |           |

*/
class LayoutEditingView_Type1: UIView {
    
    static var nib: UINib = UINib(nibName: "LayoutEditingView_Type1", bundle: Bundle(for: LayoutEditingView_Type1.self))
    private var view: UIView!
    
    @IBOutlet weak var grabbableViewAlpha: GrabbableWindowScrollView!
    @IBOutlet weak var grabbableViewBeta: GrabbableWindowScrollView!
    @IBOutlet weak var sizeControlAlpha: WindowScrollViewSizeControl!
    
    /*
    lazy var sizeControlAlpha: WindowScrollViewSizeControl = {
       
        let control = WindowScrollViewSizeControl(controlType: .horizontal)
        control.delegate = self
        return control
    }()
    */
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
//        self.addSubview(splitViewAlpha)
//        self.addSubview(splitViewBeta)
//        self.addSubview(sizeControlAlpha)
        
        view = LayoutEditingView_Type1.nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        // align view to pin to edges
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
        updateConstraintsIfNeeded()
        
        
        
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        grabbableViewAlpha.grabDelegate = self
        grabbableViewBeta.grabDelegate = self
        sizeControlAlpha.delegate = self
        
        grabbableViewAlpha.setInheritedConstraintValues(values: [0, 0, self.frame.size.width, self.frame.size.height / 2], shouldUpdateCurrentValues: true)
        grabbableViewAlpha.updateImageViewConstraints()
        
        grabbableViewBeta.setInheritedConstraintValues(values: [0, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height / 2], shouldUpdateCurrentValues: true)
        grabbableViewBeta.updateImageViewConstraints()
        
        sizeControlAlpha.setConstraintValues(values: [0, self.frame.size.height / 2 - 15, self.frame.size.width, 30])
        
    }
    
}

extension LayoutEditingView_Type1: GrabDelegate {
    func viewDidGrabbed(grabbableView: GrabbableWindowScrollView) {
        view.bringSubview(toFront: grabbableView)
    }
    
    func viewDidMove(grabbableView: GrabbableWindowScrollView, delta: CGPoint) {
        
        grabbableView.update(offsetDelta: delta)
    }
    
    func viewDidDropped(grabbableView: GrabbableWindowScrollView) {
        grabbableView.resetCurrentConstraintsToInheritedValues()
    }
}


extension LayoutEditingView_Type1: WindowScrollViewSizeControlProtocol {
    
    
    func shouldMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint) -> Bool {
        
        /*
         The size control must stay in the boundRect. Otherwise, the
         movement must not be allowed.
         */
        let newCenterWillBe = CGPoint(x: sizeControl.center.x + delta.x,
                                      y: sizeControl.center.y + delta.y)
        var boundRect = CGRect.zero
        
        if sizeControl === self.sizeControlAlpha {
            boundRect = CGRect(x: 0, y: 50,
                               width: self.frame.size.width,
                               height: self.frame.size.height - 100)
            
        } else {
            return false
        }
        
        return boundRect.contains(newCenterWillBe)
    }
    
    func didMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint) {
        
        if sizeControl === self.sizeControlAlpha {
            
            grabbableViewAlpha.update(sizeDelta: CGSize(width: 0, height: delta.y))
            grabbableViewBeta.update(offsetDelta: CGPoint(x: 0, y: delta.y))
            grabbableViewBeta.update(sizeDelta: CGSize(width: 0, height: -delta.y))
            
        }
    }
}

