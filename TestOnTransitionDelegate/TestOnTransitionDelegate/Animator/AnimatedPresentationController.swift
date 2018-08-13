//
//  AnimatedPresentationController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 21/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class AnimatedPresentationController: UIPresentationController {
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        
        bgView.frame = containerView!.bounds
        containerView!.insertSubview(bgView, at: 0)
        
        
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.bgView.alpha = 0.3
                
                self.presentingViewController.view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                self.presentedViewController.view.transform = CGAffineTransform(translationX: 0, y: 30)
                
            }, completion: nil)
        }
        
        
    }
    
    override func dismissalTransitionWillBegin()  {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.bgView.alpha = 0
                self.presentingViewController.view.transform = CGAffineTransform.identity
                
            }, completion: { _ in
                self.presentedViewController.view.transform = CGAffineTransform.identity
            })
            
            
        }
    }
    
}
