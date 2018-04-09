//
//  ViewController.swift
//  TestOnConstraintAnimation
//
//  Created by GIWON1 on 2018. 4. 9..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        heightConstraint.constant = 500
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
}

