//
//  ViewController.swift
//  TestsOnKVO
//
//  Created by SeoGiwon on 28/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @objc var value: CGFloat = 0
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        value = 3
        
        print(value)
    }
    @IBAction func btn1Tapped(_ sender: UIButton) {
        setValue(1, forKey: "value")
        
        print(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        value.addOb
        self.addObserver(self, forKeyPath: #keyPath(ViewController.value), options: [.new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        print("abccdfdf")
    }

}

