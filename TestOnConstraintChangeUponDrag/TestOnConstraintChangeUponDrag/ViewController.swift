//
//  ViewController.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 07/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theView: GrabbableWindowScrollView!
    @IBOutlet weak var myView: GrabbableWindowScrollView!
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        
        
        let theViewConstraintValues = theView.constraintValues()
        let myViewConstraintValues = myView.constraintValues()
        
        theView.setConstraintValues(values: myViewConstraintValues)
        myView.setConstraintValues(values: theViewConstraintValues)
       
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theView.grabDelegate = self
        myView.grabDelegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: GrabDelegate {
    func viewDidGrabbed(grabbableView: GrabbableWindowScrollView) {
        
    }
    
    func viewDidMove(grabbableView: GrabbableWindowScrollView, delta: CGPoint) {
        
        grabbableView.update(offsetDelta: delta, shouldUpdateInheritedConstraints: true)
    }
    
    func viewDidDropped(grabbableView: GrabbableWindowScrollView) {
        
    }
}
