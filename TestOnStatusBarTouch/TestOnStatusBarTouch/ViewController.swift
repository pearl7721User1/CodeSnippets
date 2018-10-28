//
//  ViewController.swift
//  TestOnStatusBarTouch
//
//  Created by SeoGiwon on 30/06/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let theView = MyView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        self.view.addSubview(theView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        theView.frame = self.view.bounds
    }

}

