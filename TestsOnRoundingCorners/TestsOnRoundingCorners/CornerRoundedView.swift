//
//  CornerRoundedView.swift
//  TestsOnRoundingCorners
//
//  Created by SeoGiwon on 11/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class CornerRoundedView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path1 = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint(x: 0, y: 10), size: CGSize(width: self.bounds.width, height: self.bounds.height / 2.0)),
                                byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        
        let path2 = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint(x: 0, y: 20), size: CGSize(width: self.bounds.width, height: self.bounds.height / 2.0)),
                                 byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        
        let path3 = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint(x: 0, y: 30), size: CGSize(width: self.bounds.width, height: self.bounds.height / 2.0)),
                                 byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        
        if let ctx = UIGraphicsGetCurrentContext() {
            
            ctx.addPath(path1.cgPath)
            ctx.addPath(path2.cgPath)
            ctx.addPath(path3.cgPath)
            ctx.setStrokeColor(UIColor.red.cgColor)
            ctx.setLineWidth(1.0)
            ctx.strokePath()
        }
        
        
        
    }
 

}
