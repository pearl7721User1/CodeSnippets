//
//  ViewController.swift
//  TestOnCAShapeLayer
//
//  Created by GIWON1 on 2018. 3. 19..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shapeView = TabShapeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        self.view.addGestureRecognizer(recognizer)
        
        shapeView.frame = CGRect(x: 50, y: 200, width: 200, height: 200)
        self.view.addSubview(shapeView)
    }


    @objc func didPan(sender: UIPanGestureRecognizer) {
       
        let translation = sender.translation(in: self.view)
        
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        
        shapeView.updatePath(yTranslation: translation.y)
        
        CATransaction.commit()
        
    }


}

