//
//  MyNavigationController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 14/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    
    
    var animator = AnimatedPushPopController()
    
    lazy var blueViewController: BlueViewController = {
       
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        
        return vc
    }()
    
    lazy var greenViewController: GreenViewController = {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    func performTransitionToBlueViewController() {
        
        if let topViewController = self.topViewController as? RedViewController {
            animator.transitionInfo = topViewController.transitionInfo()
            self.pushViewController(blueViewController, animated: true)
        }
    }
    
    func performDismissToRedViewController() {
        
        if let topViewController = self.topViewController as? BlueViewController {
            self.popViewController(animated: true)
        }
        
    }
    
    func performPresentGreenViewController() {
        
        self.present(greenViewController, animated: true, completion: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // the return is selective to particular operation, view controllers
        if (operation == .push) && ((fromVC as? RedViewController) != nil) {
            return animator
        }
        
        if (operation == .pop) && ((toVC as? RedViewController) != nil) {
            return animator
        }
        
        return nil
    }
    /*
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
    }
    */
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        
        if let topViewController = self.topViewController as? RedViewController {
            
            return AnimatedPresentationController(presentedViewController: greenViewController, presenting: topViewController)
        } else {
            return nil
        }
        
        
    }
    
}
