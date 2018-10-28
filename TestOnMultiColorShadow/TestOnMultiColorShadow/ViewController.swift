//
//  ViewController.swift
//  TestOnMultiColorShadow
//
//  Created by SeoGiwon on 22/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var layer = CALayer()
    var layer2 = CALayer()
    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    @IBOutlet weak var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let img1 = UIImage(named: "img.jpg")
        let img2 = UIImage(named: "img.jpg")
        
        
        layer.contents = img1?.cgImage
        layer.frame = CGRect(x: 60, y: 60, width: 180, height: 180)
        
        self.view.layer.addSublayer(layer)
        self.view.clipsToBounds = false
        
        
        visualEffectView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        self.view.addSubview(visualEffectView)
        
        layer2.contents = img2?.cgImage
        layer2.frame = CGRect(x: 60, y: 60, width: 180 - 0.5, height: 180 - 0.5)
        self.view.layer.addSublayer(layer2)
        
        
    }
    
    
    @IBAction func btn1Tapped(_ sender: UIButton) {
        layer2.transform = CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 0.5)
        visualEffectView.isHidden = true
        
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        layer2.transform = CATransform3DIdentity
        visualEffectView.isHidden = false
    }
}

