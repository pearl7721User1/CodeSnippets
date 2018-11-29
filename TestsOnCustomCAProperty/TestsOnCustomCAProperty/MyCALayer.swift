//
//  MyCALayer.swift
//  TestsOnCustomCAProperty
//
//  Created by SeoGiwon on 25/11/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyCALayer: CALayer {

    override class func needsDisplay(forKey key: String) -> Bool {
        if key == #keyPath(bezierControlPointXOffset) || key == #keyPath(bezierControlPointYOffset) {
            return true
        }
        return super.needsDisplay(forKey: key)
    }
    
    @objc private var bezierControlPointXOffset: CGFloat = 0
    @objc private var bezierControlPointYOffset: CGFloat = 0
    
    private let xoffsetMin: CGFloat = 0
    private let xoffsetMax: CGFloat = 5
    private let yoffsetMin: CGFloat = 0
    private let yoffsetMax: CGFloat = 15
    
    override func draw(in ctx: CGContext) {
        
        ctx.setLineWidth(3.0)
        ctx.setStrokeColor(UIColor.gray.cgColor)
        
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x:self.bounds.midX - 25, y:self.bounds.midY))
        
        bezier.addCurve(to: CGPoint(x:self.bounds.midX + 25, y:self.bounds.midY),
                        controlPoint1: CGPoint(x:self.bounds.midX - bezierControlPointXOffset, y:self.bounds.midY + bezierControlPointYOffset),
                        controlPoint2: CGPoint(x:self.bounds.midX + bezierControlPointXOffset, y:self.bounds.midY + bezierControlPointYOffset))
        
        ctx.addPath(bezier.cgPath)
        ctx.strokePath()
        
        print("draw \(bezierControlPointXOffset)")
    }
    
    func goCrooked() {
        
        let anim = CABasicAnimation(keyPath: "bezierControlPointXOffset")
        anim.duration = 0.2
        anim.fromValue = self.bezierControlPointXOffset
        anim.toValue = xoffsetMax
        self.add(anim, forKey: "bezierControlPointXOffset")
        self.bezierControlPointXOffset = xoffsetMax
        
        let anim2 = CABasicAnimation(keyPath: "bezierControlPointYOffset")
        anim2.duration = 0.2
        anim2.fromValue = self.bezierControlPointYOffset
        anim2.toValue = yoffsetMax
        self.add(anim2, forKey: "bezierControlPointYOffset")
        self.bezierControlPointYOffset = yoffsetMax
 
        self.setNeedsDisplay()
    }
    
    func goStraight() {
        
        let anim = CABasicAnimation(keyPath: "bezierControlPointXOffset")
        anim.duration = 0.2
        anim.fromValue = self.bezierControlPointXOffset
        anim.toValue = xoffsetMin
        self.add(anim, forKey: "bezierControlPointXOffset")
        self.bezierControlPointXOffset = xoffsetMin
        
        let anim2 = CABasicAnimation(keyPath: "bezierControlPointYOffset")
        anim2.duration = 0.2
        anim2.fromValue = self.bezierControlPointYOffset
        anim2.toValue = yoffsetMin
        self.add(anim2, forKey: "bezierControlPointYOffset")
        self.bezierControlPointYOffset = yoffsetMin
        
        self.setNeedsDisplay()
    }
}
