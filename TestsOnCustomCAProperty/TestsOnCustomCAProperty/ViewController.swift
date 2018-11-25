//
//  ViewController.swift
//  TestsOnCustomCAProperty
//
//  Created by SeoGiwon on 25/11/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lineLayer = MyCALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        
        
        //        lineLayer.backgroundColor = UIColor.blue.cgColor
        lineLayer.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        self.view.layer.addSublayer(lineLayer)
        
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let yTranslation = 0.0
        let anim = CABasicAnimation(keyPath: "yTranslation")
        anim.duration = 0.2
        anim.fromValue = 0
        anim.toValue = 50
        lineLayer.add(anim, forKey: "yTranslationAnimation")
        lineLayer.yTranslation = 50
    }
    


}

