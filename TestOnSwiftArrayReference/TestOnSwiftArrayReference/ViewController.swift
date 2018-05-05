//
//  ViewController.swift
//  TestOnSwiftArrayReference
//
//  Created by SeoGiwon on 01/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var array = ["abc", "bcd", "def"]
        
        var copyArray = UnsafePointer(array)//UnsafePointer<[String]>()
        
        array = ["eee"]
  
        
        copyArray.poin
        
        print(copyArray.pointee.count)
        print(array.count)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

