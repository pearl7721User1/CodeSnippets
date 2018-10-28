//
//  MyView.swift
//  TestOnMultiColorShadow
//
//  Created by SeoGiwon on 22/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var image: UIImage! {
        didSet {
            setupSubviews()
        }
    }
    private var bgImageLayer: CALayer?
    private var overlayImageLayer: CALayer?
    private var visualEffectView: UIVisualEffectView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupSubviews() {
        bgImageLayer = CALayer()
        bgImageLayer?.contents = image.cgImage
        
        overlayImageLayer = CALayer()
        overlayImageLayer?.contents = image.cgImage
        
        visualEffectView = UIVisualEffectView()
        
        
    }
    
}
