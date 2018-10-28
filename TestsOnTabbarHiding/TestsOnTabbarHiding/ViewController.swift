//
//  ViewController.swift
//  TestsOnTabbarHiding
//
//  Created by SeoGiwon on 29/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn1Tapped(_ sender: UIButton) {
//        self.tabBarController?.tabBar.isHidden = true
        
        self.tabBarController?.tabBar.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
//        self.tabBarController?.tabBar.isHidden = false
        
        self.tabBarController?.tabBar.center = CGPoint(x: 50, y: self.view.bounds.midY)
    }
}

