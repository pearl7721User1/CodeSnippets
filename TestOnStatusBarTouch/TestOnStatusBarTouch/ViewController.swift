//
//  ViewController.swift
//  TestOnStatusBarTouch
//
//  Created by SeoGiwon on 30/06/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(statusBarTapped), name: Notification.Name(rawValue: "statusBarTappedNotification"), object: nil)
        
        
    }
    
    @objc func statusBarTapped() {
        
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

