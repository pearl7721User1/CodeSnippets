//
//  ViewController.swift
//  TestsOnTransformAnimation
//
//  Created by SeoGiwon on 10/02/2019.
//  Copyright © 2019 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let destinationView = UIView()
        destinationView.backgroundColor = UIColor.green
        destinationView.frame = CGRect(x: 50, y: 300, width: 160, height: 160)
        self.view.addSubview(destinationView)
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        
        let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let translationTransform = CGAffineTransform(translationX: 50 - theView.frame.origin.x + 40, y: 300 - theView.frame.origin.y + 40)
        
        
        theView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            
            self.theView.transform = scaleTransform.concatenating(translationTransform)//translationTransform.scaledBy(x: 2.0, y: 2.0)
            
        }, completion: nil)
        
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            
            self.theView.transform = CGAffineTransform.identity
            
        }, completion: nil)
        
    }
    
    @IBAction func btn3Tapped(_ sender: UIButton) {
        
        print("==============================")
        print("frame:\(theView.frame.origin.x), \(theView.frame.origin.y), \(theView.frame.size.width), \(theView.frame.size.height)")
        print("bounds:\(theView.bounds.origin.x), \(theView.bounds.origin.y), \(theView.bounds.size.width), \(theView.bounds.size.height)")
    }
    
}

