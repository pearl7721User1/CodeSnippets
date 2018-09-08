//
//  PileView.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 15/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit



class PileCollectionView: UIView {

    
    let magicNumber = 50
    
    var topConstantMax: CGFloat {
        
        return -CGFloat((pileViews.count-1)*magicNumber)
    }
    
    let pileViewColors = [UIColor(hue: 0.0, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.15, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.3, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.45, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.6, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.75, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 0.9, saturation: 0.5, brightness: 0.8, alpha: 1.0),
                          UIColor(hue: 1.0, saturation: 0.5, brightness: 0.8, alpha: 1.0)]
    
    var pileViews: [PileView] {
        return self.subviews as! [PileView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.clipsToBounds = true
        
        let pg = UIPanGestureRecognizer(target: self, action: #selector(panHandler))
        self.addGestureRecognizer(pg)
    }
    
    private func isValidConstraintsValue() -> (Bool, CGPoint) {
        
        guard let firstPileView = pileViews.first else {
            return (false, CGPoint.zero)
        }
        
        let constant = firstPileView.topConstraintConstant()
        
        if constant > 0 {
            return (false, CGPoint(x: 0, y: -constant)) // compensation value
        } else if constant < topConstantMax {
            return (false, CGPoint(x: 0, y: topConstantMax - constant))
        } else {
            return (true, CGPoint.zero)
        }
    }
    
    func pushPile() {
        
        let bottomPileView = pileViews.last
        
        let pileView = PileView(labelText: "Pile No.\(pileViews.count+1)")
        let colorIndex = pileViews.count % pileViewColors.count
        pileView.backgroundColor = pileViewColors[colorIndex]
        self.addSubview(pileView)

        pileView.setupConstraints(topView: bottomPileView, constant: bottomPileView != nil ?CGFloat(magicNumber) : 0, superView: self)
    }
    
    func popPile() {
        
        if pileViews.last != nil {
            pileViews.last!.removeFromSuperview()
        }
        /*
        // iterate pileStack and reflect changes
        for (_,v) in pileStack.enumerated() {
            v.oneStepIn()
        }
         */
        
    }
    
    
    // MARK: - pan gesture recognizer
    @objc func panHandler(_ gestureRecognizer:UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view)
        gestureRecognizer.setTranslation(CGPoint.zero, in: gestureRecognizer.view)
        
        guard let bottomMostPileView = pileViews.first else {
            return
        }
            
            
        
        if [UIGestureRecognizerState.began, UIGestureRecognizerState.changed].contains(gestureRecognizer.state) {
            
            bottomMostPileView.translate(translation: translation)
            layoutIfNeeded()
            
        } else {
            
            
            let validConstraintsTuple = isValidConstraintsValue()
            if !validConstraintsTuple.0 {
                
                bottomMostPileView.translate(translation: validConstraintsTuple.1)
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: [], animations: {
                    self.layoutIfNeeded()
                }, completion: nil)
            }
        }
        
        
        
    }
    
}

