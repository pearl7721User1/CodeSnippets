//
//  ImageShadeEffectView.swift
//  TestOnMultiColorShadow
//
//  Created by GIWON1 on 2018. 11. 15..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit

@IBDesignable
class ImageShadeEffectView: UIView {

    private var imgBackgroundLayer = CALayer()
    private var imgLayer = CALayer()
    private var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    @IBInspectable var img: UIImage? {
        didSet {
            imgLayer.contents = img?.cgImage
            imgBackgroundLayer.contents = img?.cgImage
        }
    }
    @IBInspectable var scaleAnimationFactor: CGFloat = 0.5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgBackgroundLayer.frame = self.bounds
        imgLayer.frame = self.bounds
        
        visualEffectView.frame = self.bounds.insetBy(dx: -100, dy: -100)

    }
    
    private func commonInit() {

        // add layers
        self.layer.addSublayer(imgBackgroundLayer)
        self.addSubview(visualEffectView)
        self.layer.addSublayer(imgLayer)
        
     }
    
    func function1() {
        imgLayer.transform = CATransform3DScale(CATransform3DIdentity, scaleAnimationFactor, scaleAnimationFactor, scaleAnimationFactor)
        visualEffectView.isHidden = true
        imgBackgroundLayer.isHidden = true

    }

    func function2() {
        imgLayer.transform = CATransform3DIdentity
        visualEffectView.isHidden = false
        imgBackgroundLayer.isHidden = false

        
        visualEffectView.frame = self.bounds
        visualEffectView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
}
