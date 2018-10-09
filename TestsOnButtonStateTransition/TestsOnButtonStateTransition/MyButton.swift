//
//  MyButton.swift
//  ButtonTouchUpInside
//
//  Created by SeoGiwon on 27/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

@IBDesignable
class MyButton: UIButton {
    
    private let bglayer = CALayer()
    private let bgImgLayer = CALayer()
    
    @IBInspectable var firstButtonImage: UIImage? {
        didSet {
            bgImgLayer.contents = firstButtonImage?.cgImage
        }
    }
    @IBInspectable var secondButtonImage: UIImage?    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        self.layer.addSublayer(bgImgLayer)
        self.layer.insertSublayer(bglayer, below: bgImgLayer)
        bglayer.backgroundColor = UIColor(white: 0.7, alpha: 1.0).cgColor
        bglayer.opacity = 0
        
        self.addTarget(self, action: #selector(touchDownAction), for: .touchDown)
        self.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
        self.addTarget(self, action: #selector(touchDragInside), for: .touchDragInside)
        self.addTarget(self, action: #selector(touchDragOutside), for: .touchDragOutside)
    }

    @objc func touchDownAction() {
        self.transitionAnimation(isTouchingDown: true)
        print("-------touchDown")
    }
    
    @objc func touchDragInside(_ sender: MyButton) {
        print("touchDragOutside")
        sender.transitionAnimation(isTouchingDown: true)
    }
    
    @objc func touchDragOutside(_ sender: MyButton) {
        print("touchDragOutside")
        sender.transitionAnimation(isTouchingDown: false)
    }
    
    @objc func touchUpInsideAction() {
        self.transitionAnimation(isTouchingDown: false)
        print("-------touchUpInside")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bglayer.frame = self.bounds
        bglayer.cornerRadius = self.bounds.size.width / 2
        bgImgLayer.frame = self.bounds
    }
    
    override var intrinsicContentSize: CGSize {
        if let firstButtonImage = firstButtonImage {
            return firstButtonImage.size
        } else {
            return CGSize(width: 40, height: 40)
        }
    }

    func transitionAnimation(isTouchingDown: Bool) {
        
        bglayer.opacity = isTouchingDown ? 0.5 : 0
        bgImgLayer.transform = isTouchingDown ? CATransform3DScale(CATransform3DIdentity, 0.8, 0.8, 0.8) : CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1.0)
        
    }
    
    func showPlayIcon(isPlaying: Bool) {
        bgImgLayer.contents = isPlaying ? secondButtonImage?.cgImage : firstButtonImage?.cgImage
    }
}
