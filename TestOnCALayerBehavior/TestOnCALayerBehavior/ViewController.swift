//
//  ViewController.swift
//  TestOnCALayerBehavior
//
//  Created by SeoGiwon on 20/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myView.updateViewBoundaryLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        myView.frame.size = CGSize(width: myView.frame.size.width, height: myView.frame.size.height + 10)
        myView.updateViewBoundaryLayer()
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        
        let pt = sender.translation(in: sender.view)
        
        myView.frame.size = CGSize(width: myView.frame.size.width + pt.x, height: myView.frame.size.height + pt.y)
        
        sender.setTranslation(CGPoint.zero, in: sender.view)
        
        myView.updateViewBoundaryLayer()
    }
}

