//
//  DismissAnimationController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 18/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class DismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var transitionInfo: MyTransitionInfo?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to),
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
                
                fatalError("UITransitionContextViewKey.to for springUpAnimator is unavailable")
        }
        
        /*
         containerView:
         The view that contains both views involved in the transition.
         
         Discussion
         The container view acts as the superview of all other views (including those of the presenting and presented view controllers) during the animation sequence. UIKit sets this view for you and automatically adds the view of the presenting view controller to it. The animator object is responsible for adding the view of the presented view controller, and the animator object or presentation controller must use this view as the container for all other views involved in the transition.
         */
        let containerView = transitionContext.containerView
        // fromView is the subview of the containerView at this point
        
        let s = containerView.subviews
        
        
        guard let transitionInfo = transitionInfo,
            transitionInfo.views.count == transitionInfo.fromFrames.count,
            transitionInfo.fromFrames.count == transitionInfo.toFrames.count else {
                fatalError()
        }
        
        let theDuplicateView = duplicateView(from: fromView, for: transitionInfo)
        containerView.addSubview(theDuplicateView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            
            // animate subviews of the copycat view
            for (i, subview) in theDuplicateView.subviews.enumerated() {
                
                subview.frame = transitionInfo.toFrames[i]
                subview.clipsToBounds = true
                subview.contentMode = .scaleAspectFill
            }
            
            
        }, completion: { (finished) in
            
            theDuplicateView.removeFromSuperview()
            containerView.addSubview(toView)
            transitionContext.completeTransition(finished)
        })
        
    }
    
    private func duplicateView(from view: UIView, for transitionInfo: MyTransitionInfo) -> UIView {
        let duplicateView = UIView(frame: view.frame)
        duplicateView.backgroundColor = view.backgroundColor
        duplicateView.alpha = view.alpha
        
        let subviews = transitionInfo.views
        let fromFrames = transitionInfo.fromFrames
        
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
