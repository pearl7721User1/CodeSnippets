//
//  ViewController.swift
//  TestsOnHitTestingOnStatusBar
//
//  Created by SeoGiwon on 08/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func loadView() {
        
        super.loadView()
        let myView = MyView()
        self.view = myView
        
    }
}

