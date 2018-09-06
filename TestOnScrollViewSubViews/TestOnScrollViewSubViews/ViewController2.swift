//
//  ViewController2.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 13/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var constraint1: NSLayoutConstraint!
    @IBOutlet weak var constraint2: NSLayoutConstraint!
    @IBOutlet weak var constraint3: NSLayoutConstraint!
    
    let c1: CGFloat = 30
    let c2: CGFloat = 8
    let c3: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPullTapped(_ sender: UIButton) {
        constraint2.constant = 10
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            
            self.constraint2.constant = 30
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: sender.view)
        adjustConstraints(translationX: translation.x)
        
        print("x:\(translation.x) y:\(translation.y)")
        
        if sender.state == .cancelled || sender.state == .ended {
            
            adjustConstraints(translationX: 0)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                self.view.layoutIfNeeded()
            }, completion:nil)
        }
    }
    
    private func adjustConstraints(translationX: CGFloat) {
        
        let scaleDownX = translationX / 3.0
        
        constraint1.constant = c1 + scaleDownX
        constraint2.constant = c2 + scaleDownX
        constraint3.constant = c3 + scaleDownX
        
    }
    
    
}
