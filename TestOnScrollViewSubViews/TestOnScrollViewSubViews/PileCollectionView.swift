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
    
    var leadingConstantMax: CGFloat {
        
        return CGFloat((pileViews.count-1)*magicNumber)
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
        
        var constant = firstPileView.leadingConstraintConstant()
        
        if constant < 0 {
            return (false, CGPoint(x: -constant, y: 0)) // compensation value
        } else if constant > leadingConstantMax {
            return (false, CGPoint(x: leadingConstantMax - constant, y: 0))
        } else {
            return (true, CGPoint.zero)
        }
    }
    
    func pushPile() {
        let pileView = PileView()
        let colorIndex = pileViews.count % pileViewColors.count
        pileView.backgroundColor = pileViewColors[colorIndex]
        self.addSubview(pileView)
        
        pileView.setupConstraintsToSuperView(leadingConstant: CGFloat(magicNumber * (pileViews.count-1)))
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
        
//        print("x:\(translation.x),y: \(translation.y)")
        
        
        
        if [UIGestureRecognizerState.began, UIGestureRecognizerState.changed].contains(gestureRecognizer.state) {
            for (_, v) in pileViews.enumerated() {
                v.translate(translation: translation)
            }
        } else {
            
            
            let validConstraintsTuple = isValidConstraintsValue()
            
            print("x:\(validConstraintsTuple.1.x)")
            
            if !isValidConstraintsValue().0 {
                for (_, v) in pileViews.enumerated() {
                    
                    let abc = isValidConstraintsValue().1
                    
                    
                    v.translate(translation: isValidConstraintsValue().1)
                }
                
            }
        }
        
        
        
    }
    
}

