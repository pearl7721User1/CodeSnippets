//
//  Pile.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 18/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class PileView: UIView {

    var leadingConstraint: NSLayoutConstraint!
    
    var savedConstant: CGFloat = 0.0
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setupConstraints(leadingView:UIView?, constant:CGFloat, superView:UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set leading constraint
        leadingConstraint = self.leadingAnchor.constraint(equalTo: leadingView != nil ? leadingView!.leadingAnchor : superView.leadingAnchor, constant: constant)
        leadingConstraint.isActive = true
        
        // set width constraint
        self.widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true
        
        // set top, bottom constraint
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    func leadingConstraintConstant() -> CGFloat {
        return self.leadingConstraint.constant
    }
    
    func translate(translation: CGPoint) {
        
        
        print("\(self.hash), prev:\(leadingConstraint.constant)")
        
        leadingConstraint.constant = leadingConstraint.constant + translation.x
        print("\(self.hash), translation.x:\(translation.x)")
        print("\(self.hash), next:\(leadingConstraint.constant)")
        
    }
    
    func pick() {
        save(constant: leadingConstraint.constant)
        leadingConstraint.constant = 0
    }
    
    func dissolve() {
        leadingConstraint.constant = self.bounds.width - 5
    }
    
    func reset() {
        leadingConstraint.constant = loadConstant()
    }
    
    func oneStepOut() {
        leadingConstraint.constant = leadingConstraint.constant + 50
    }
    
    func oneStepIn() {
        leadingConstraint.constant = leadingConstraint.constant - 50
    }
    
    func save(constant: CGFloat) {
        savedConstant = constant
    }
    
    func loadConstant() -> CGFloat {
        return savedConstant
    }
}
