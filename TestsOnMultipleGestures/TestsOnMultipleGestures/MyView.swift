//
//  MyView.swift
//  TestsOnMultipleGestures
//
//  Created by SeoGiwon on 31/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyView: UIView {

    let maskLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        
        updateCornerRoundingMask()
    }
    
    func updateCornerRoundingMask() {
        
        let path = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint.zero, size: CGSize(width: self.bounds.width, height: self.bounds.height)),
                                byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40.0, height: 40.0))
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
    }
}
