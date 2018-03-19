//
//  TabShapeView.swift
//  TestOnCAShapeLayer
//
//  Created by GIWON1 on 2018. 3. 19..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class TabShapeView: UIView {

    var lineLayer = CAShapeLayer()
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        
        self.layer.addSublayer(lineLayer)
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = 5.0
        updatePath(yTranslation: 0)
    }
    
    
    func updatePath(yTranslation: CGFloat) {
        
        var newYTranslation: CGFloat
        if (yTranslation <= 0) {
            newYTranslation = 0
        } else if (yTranslation >= 50) {
            newYTranslation = 50
        } else {
            newYTranslation = yTranslation
        }
        
        
        
        let bazier = UIBezierPath()
        bazier.move(to: CGPoint(x:self.bounds.minX, y:self.bounds.midY))
        bazier.addCurve(to: CGPoint(x:self.bounds.maxX, y:self.bounds.midY),
                        controlPoint1: CGPoint(x:self.bounds.midX, y:self.bounds.midY+newYTranslation),
                        controlPoint2: CGPoint(x:self.bounds.midX, y:self.bounds.midY+newYTranslation))
        
        lineLayer.path = bazier.cgPath
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
