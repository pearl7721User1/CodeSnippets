//
//  ViewController.swift
//  TestOnTimerUsage
//
//  Created by SeoGiwon on 13/06/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.sch
        
        timer = Timer(timeInterval: 1.0, repeats: true, block: { (timer: Timer) in
            print("abcdfef")
        })
        
        timer!.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

