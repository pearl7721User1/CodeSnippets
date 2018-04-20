//
//  MyView.swift
//  TestOnCALayerBehavior
//
//  Created by SeoGiwon on 20/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyView: UIView {

    var boundaryLayer = CALayer()
    
    // MARK: - Draw
    func updateViewBoundaryLayer() {
        
        
        
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        boundaryLayer.frame = self.bounds
        CATransaction.commit()
        
        boundaryLayer.borderWidth = 3.0
        boundaryLayer.borderColor = UIColor.magenta.cgColor
        
        if boundaryLayer.superlayer == nil {
            self.layer.addSublayer(boundaryLayer)
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
