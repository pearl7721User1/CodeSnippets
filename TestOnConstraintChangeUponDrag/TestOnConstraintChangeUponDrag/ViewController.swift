//
//  ViewController.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 07/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theView: WindowScrollView!
   
    
    
    @IBOutlet weak var myView: WindowScrollView!
    
    
    @IBAction func btnAction(_ sender: UIButton) {
/*
        print(theView.constraints.count)
        
        NSLayoutConstraint.deactivate([theViewLeftConstraint, theViewTopConstraint, theViewWidthConstraint, theViewHeightConstraint])
        
        print(theView.constraints.count)
        
        NSLayoutConstraint.activate([theViewLeftConstraint, theViewTopConstraint, theViewWidthConstraint, theViewHeightConstraint])
*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

