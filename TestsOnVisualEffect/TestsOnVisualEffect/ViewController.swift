//
//  ViewController.swift
//  TestsOnVisualEffect
//
//  Created by SeoGiwon on 06/10/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let color = self.navigationController?.navigationBar.barTintColor
        
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        color?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        
//        self.view.backgroundColor = color
        
//        self.navigationController?.navigationBar.barTintColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

