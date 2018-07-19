//
//  WindowScrollViewOverlayView.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 17/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class WindowScrollViewOverlayView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.borderColor = UIColor.red.cgColor
        self.isUserInteractionEnabled = false
    }
    
    // MARK: - Indicator
    var sizeControlDrawOption: SizeControlDrawingOptionOnRectEdge = [.bottom]
    var sizeControlShapeLayer = CAShapeLayer()
    
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
        
        if sizeControlDrawOption.contains(.left) {
            
            let rectWidth: CGFloat = 20.0
            let rectHeight = rect.height / 2.0
            let theRect = CGRect(x: rect.minX - rectWidth / 2.0,
                                 y: rect.midY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            ctx.addPath(clipPath)
            
            ctx.drawPath(using: .fillStroke)
            
        }
        
        if sizeControlDrawOption.contains(.right) {
            
            let rectWidth: CGFloat = 20.0
            let rectHeight = rect.height / 2.0
            let theRect = CGRect(x: rect.maxX - rectWidth / 2.0,
                                 y: rect.midY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            ctx.addPath(clipPath)
            
            ctx.drawPath(using: .fillStroke)
            
        }
        
        if sizeControlDrawOption.contains(.top) {
            /*
             let rectWidth = rect.width / 2.0
             let rectHeight: CGFloat = 20.0
             let theRect = CGRect(x: rect.midX - rectWidth / 2.0,
             y: rect.minY - rectHeight / 2.0,
             width: rectWidth, height: rectHeight)
             
             let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
             ctx.addPath(clipPath)
             
             ctx.drawPath(using: .fillStroke)
             */
            ctx.setStrokeColor(UIColor.magenta.cgColor)
            ctx.setLineWidth(3.0)
            ctx.stroke(rect)
            
        }
        
        if sizeControlDrawOption.contains(.bottom) {
            
            let rectWidth = rect.width / 2.0
            let rectHeight: CGFloat = 20.0
            let theRect = CGRect(x: rect.midX - rectWidth / 2.0,
                                 y: rect.maxY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            ctx.addPath(clipPath)
            
            ctx.drawPath(using: .fillStroke)
            
        }
        
        ctx.restoreGState()
    }
    
    func updateSizeControlShapeLayer() {
        
        
        let rect = self.bounds
        
        
        if sizeControlDrawOption.contains(.top) {
            
            let rectWidth = rect.width / 2.0
            let rectHeight: CGFloat = 20.0
            let theRect = CGRect(x: rect.midX - rectWidth / 2.0,
                                 y: rect.minY - rectHeight / 2.0,
                                 width: rectWidth, height: rectHeight)
            
            let clipPath: CGPath = UIBezierPath(roundedRect: theRect, cornerRadius: 10).cgPath
            
            sizeControlShapeLayer.path = clipPath
            sizeControlShapeLayer.fillColor = UIColor.green.cgColor
            
        }
        
        
        if sizeControlShapeLayer.superlayer == nil {
            self.layer.addSublayer(sizeControlShapeLayer)
        }
    }

}
