//
//  ViewController.swift
//  TestsOnImageShadowing
//
//  Created by SeoGiwon on 08/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.layer.shadowColor = UIColor.clear.cgColor
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.layer.shadowOpacity = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

