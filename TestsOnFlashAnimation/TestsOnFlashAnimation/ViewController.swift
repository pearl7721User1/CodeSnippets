//
//  ViewController.swift
//  TestsOnFlashAnimation
//
//  Created by SeoGiwon on 28/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let theView = UIView()
    let bglayer = CALayer()
    let bgImgLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //        theView.backgroundColor = UIColor.green
        theView.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        self.view.addSubview(theView)
        
        
        let image = UIImage(named: "play.png")
        
        bgImgLayer.frame = theView.bounds
        bgImgLayer.contents = image?.cgImage
        theView.layer.addSublayer(bgImgLayer)
        
        bglayer.backgroundColor = UIColor.gray.cgColor
        bglayer.frame = theView.bounds
        bglayer.opacity = 0
        bglayer.cornerRadius = theView.bounds.size.width / 2
        theView.layer.insertSublayer(bglayer, below: bgImgLayer)
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        
        bglayer.opacity = 0.5
        bgImgLayer.transform = CATransform3DScale(CATransform3DIdentity, 0.8, 0.8, 1.0)
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.0
        animation.toValue = 0.5
        animation.duration = 0.5
        
        bglayer.add(animation, forKey: "myAnimation")
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        
        self.bglayer.opacity = 0.0
        bgImgLayer.transform = CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1.0)
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.5
        animation.toValue = 0.0
        animation.duration = 0.5
        
        bglayer.add(animation, forKey: "myAnimation")
    }
}

