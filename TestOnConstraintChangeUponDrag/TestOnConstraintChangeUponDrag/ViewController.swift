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
        
        
        
        let theViewConstraintValues = theView.constraintValues()
        let myViewConstraintValues = myView.constraintValues()
        
        theView.setConstraintValues(values: myViewConstraintValues)
        myView.setConstraintValues(values: theViewConstraintValues)
       
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

