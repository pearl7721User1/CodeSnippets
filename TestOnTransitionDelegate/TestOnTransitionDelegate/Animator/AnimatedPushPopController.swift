//
//  AnimationController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 14/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class AnimatedPushPopController: NSObject, UIViewControllerAnimatedTransitioning {

    var transitionInfo: MyTransitionInfo?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: .to),
            let fromView = transitionContext.view(forKey: .from) else {
            
            fatalError("UITransitionContextViewKey.to for springUpAnimator is unavailable")
        }
        
        let presenting = isPresenting(using: transitionContext)
        
        /*
         containerView:
         The view that contains both views involved in the transition.
         
         Discussion
         The container view acts as the superview of all other views (including those of the presenting and presented view controllers) during the animation sequence. UIKit sets this view for you and automatically adds the view of the presenting view controller to it. The animator object is responsible for adding the view of the presented view controller, and the animator object or presentation controller must use this view as the container for all other views involved in the transition.
         */
        let containerView = transitionContext.containerView
        // fromView is the subview of the containerView at this point
        
        
        guard let transitionInfo = transitionInfo,
            transitionInfo.views.count == transitionInfo.fromFrames.count,
            transitionInfo.fromFrames.count == transitionInfo.toFrames.count else {
            fatalError()
        }
        
        let theDuplicateView = duplicateView(from: fromView, for: transitionInfo, isPresenting: presenting)
        containerView.addSubview(theDuplicateView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            
            // animate subviews of the copycat view
            for (i, subview) in theDuplicateView.subviews.enumerated() {
                
                subview.frame = presenting ? transitionInfo.toFrames[i] : transitionInfo.fromFrames[i]
                subview.clipsToBounds = true
                subview.contentMode = .scaleAspectFill
            }
            
            
        }, completion: { (finished) in
            
            theDuplicateView.removeFromSuperview()
            
            if (presenting) {
                containerView.addSubview(toView)
            } else {
                fromView.removeFromSuperview()
                containerView.addSubview(toView)
            }
            
            transitionContext.completeTransition(finished)
        })
        
    }
    
    private func isPresenting(using transitionContext: UIViewControllerContextTransitioning) -> Bool {
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            fatalError()
        }
        
        if fromViewController.isKind(of: RedViewController.self) {
            return true
        } else {
            return false
        }
    }
    
    private func duplicateView(from view: UIView, for transitionInfo: MyTransitionInfo, isPresenting: Bool) -> UIView {
        let duplicateView = UIView(frame: view.frame)
        duplicateView.backgroundColor = UIColor.white
        
        let subviews = transitionInfo.views
        let fromFrames = isPresenting ? transitionInfo.fromFrames : transitionInfo.toFrames
        
        for (i, subview) in subviews.enumerated() {
            
            subview.frame = fromFrames[i]
            
            if let images = transitionInfo.images {
                subview.layer.contents = images[i].cgImage
            }
            
            duplicateView.addSubview(subview)
        }
        
        return duplicateView
    }
    
}
