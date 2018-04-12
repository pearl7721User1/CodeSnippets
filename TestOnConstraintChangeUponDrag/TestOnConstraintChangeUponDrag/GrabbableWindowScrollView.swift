//
//  GrabbableWindowScrollView.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 10/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

protocol GrabDelegate {
    
    func viewDidGrabbed(grabbableView: GrabbableWindowScrollView)
    func viewDidMove(grabbableView: GrabbableWindowScrollView, delta: CGPoint)
    func viewDidDropped(grabbableView: GrabbableWindowScrollView)
}

class GrabbableWindowScrollView: WindowScrollView {

    var grabDelegate: GrabDelegate?
    var grabPoint: CGPoint?
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        self.addGestureRecognizer(longGesture)
        
    }
    
    
    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        
        
        switch sender.state {
        case .began:
            
            grabPoint = sender.location(in: superview)
            grabDelegate?.viewDidGrabbed(grabbableView: self)
            
        case .changed:
            
            if grabPoint != nil {
                let grabOffset = CGPoint(x:sender.location(in: superview).x - grabPoint!.x,
                                         y:sender.location(in: superview).y - grabPoint!.y)
                
                
                grabDelegate?.viewDidMove(grabbableView: self, delta: grabOffset)
                grabPoint = sender.location(in: superview)
            }
            
            
        case .ended, .cancelled:
            
            grabDelegate?.viewDidDropped(grabbableView: self)
            
        default:
            break
        }
    }

    func UIUpdate() {
        
    }
}
