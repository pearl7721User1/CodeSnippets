//
//  Pile.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 18/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class PileView: UIView {

    var topConstraint: NSLayoutConstraint!
    
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
    
    func setupConstraints(topView:UIView?, constant:CGFloat, superView:UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set top constraint
        topConstraint = self.topAnchor.constraint(equalTo: topView != nil ? topView!.topAnchor : superView.topAnchor, constant: constant)
        topConstraint.isActive = true
        
        // set height constraint
        self.heightAnchor.constraint(equalTo: superView.heightAnchor).isActive = true
        
        // set leading, trailing constraint
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func topConstraintConstant() -> CGFloat {
        return self.topConstraint.constant
    }
    
    func translate(translation: CGPoint) {
        
        
        print("\(self.hash), prev:\(topConstraint.constant)")
        
        topConstraint.constant = topConstraint.constant + translation.y
        print("\(self.hash), translation.x:\(translation.x)")
        print("\(self.hash), next:\(topConstraint.constant)")
        
    }
    
    func pick() {
        save(constant: topConstraint.constant)
        topConstraint.constant = 0
    }
    
    func dissolve() {
        topConstraint.constant = self.bounds.width - 5
    }
    
    func reset() {
        topConstraint.constant = loadConstant()
    }
    
    func oneStepOut() {
        topConstraint.constant = topConstraint.constant + 50
    }
    
    func oneStepIn() {
        topConstraint.constant = topConstraint.constant - 50
    }
    
    func save(constant: CGFloat) {
        savedConstant = constant
    }
    
    func loadConstant() -> CGFloat {
        return savedConstant
    }
}
