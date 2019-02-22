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
        
        //        lineLayer.backgroundColor = UIColor.blue.cgColor
        lineLayer.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        self.view.layer.addSublayer(lineLayer)
        lineLayer.setNeedsDisplay()
        
        
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        lineLayer.goCrooked()
    }
    
    @IBAction func btnTapped2(_ sender: UIButton) {
        
        lineLayer.goStraight()
    }
    
    

    
}

