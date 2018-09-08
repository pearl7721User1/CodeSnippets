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
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        updateShadowOnTop()
//        updateRoundCorners()
    }
    
    
    
    private func updateRoundCorners() {
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint(x: 0, y: -10), size: CGSize(width: self.bounds.width, height: self.bounds.height+5)),
                                byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        
        // TODO: - dynamical corner radius size needed
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    private func updateShadowOnTop() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10
        
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

extension PileView {
    
    convenience init(labelText: String) {
        self.init(frame: CGRect.zero)
        setupLabel(text: labelText)
    }
    
    fileprivate func setupLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.white
        
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

