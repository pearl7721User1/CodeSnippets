//
//  ViewController.swift
//  TestsOnMultipleGestures
//
//  Created by SeoGiwon on 31/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var theView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        theView.updateCornerRoundingMask()
    }

    @IBAction func button1Tapped(_ sender: UIButton) {
        viewWidthConstraint.constant = 80
        viewHeightConstraint.constant = 100
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        theView.updateCornerRoundingMask()
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print("tap")
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        print("pan")
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        print("longPress")
    }
    
    
}

