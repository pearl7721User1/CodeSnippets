//
//  ViewController.swift
//  TestOnCustomScrollView
//
//  Created by SeoGiwon on 18/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var scrollViewController: MyScrollViewController = {
       
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyScrollViewController") as! MyScrollViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addChildViewController(scrollViewController)
        scrollViewController.view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: 200))
        self.view.addSubview(scrollViewController.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

