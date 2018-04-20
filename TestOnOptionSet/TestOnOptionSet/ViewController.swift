//
//  ViewController.swift
//  TestOnOptionSet
//
//  Created by SeoGiwon on 20/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var options: SizeControlOnEdgeOption = [.left, .top]
        
        if options.contains(.left) {
            print("left")
        }
        
        if options.contains(.top) {
            print("top")
        }
        
        /*
        
        
        var freeOptions: ShippingOptions = []
        if purchasePrice > 50 {
            freeOptions.insert(.priority)
        }
        
        if freeOptions.contains(.priority) {
            print("You've earned free priority shipping!")
        } else {
            print("Add more to your cart for free priority shipping!")
        }
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

