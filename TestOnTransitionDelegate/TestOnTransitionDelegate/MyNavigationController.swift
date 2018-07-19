//
//  MyNavigationController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 14/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController, UINavigationControllerDelegate {

    var animator = AnimationController()
    var dismissAnimator = DismissAnimationController()
    
    lazy var blueViewController: BlueViewController = {
       
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func performTransitionToBlueViewController(from viewController: UIViewController, with transitionInfo: MyTransitionInfo) {
        // set
        animator.transitionInfo = transitionInfo
        self.pushViewController(blueViewController, animated: true)
        
    }
    
    func performDismiss(from viewController: UIViewController, with transitionInfo: MyTransitionInfo) {
        
        dismissAnimator.transitionInfo = transitionInfo
        self.popViewController(animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // the return is selective to particular operation, view controllers
        if (operation == .push) && ((fromVC as? RedViewController) != nil) {
            return animator
        }
        
        if (operation == .pop) && ((toVC as? RedViewController) != nil) {
            return dismissAnimator
        }
        
        return nil
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
