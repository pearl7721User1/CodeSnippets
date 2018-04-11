//
//  SplitView.swift
//  ReplaceScrollViewTest
//
//  Created by SeoGiwon on 04/08/2017.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

/**
    LayoutEditingView_Type1 is a view that has two views(splitViewAlpha, splitViewBeta, and
    one size control(sizeControlAlpha).
    |           |
    |           |
    |-----------|
    |           |
    |           |

*/
class LayoutEditingView_Type1: UIView {
    
    static var nib: UINib = UINib(nibName: "LayoutEditingView_Type1", bundle: Bundle(for: LayoutEditingView_Type1.self))
    private var view: UIView!
    
    @IBOutlet weak var grabbableViewAlpha: GrabbableWindowScrollView!
    @IBOutlet weak var grabbableViewBeta: GrabbableWindowScrollView!
    
    /*
    lazy var sizeControlAlpha: LayoutEditingSizeControl = {
       
        let control = LayoutEditingSizeControl(controlType: .horizontal)
        control.delegate = self
        return control
    }()
    */
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
//        self.addSubview(splitViewAlpha)
//        self.addSubview(splitViewBeta)
//        self.addSubview(sizeControlAlpha)
        
        view = LayoutEditingView_Type1.nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        // align view to pin to edges
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
        updateConstraintsIfNeeded()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        
        
        grabbableViewAlpha.testModifyingConstraintsConstants(top: 0, left: 0, width: self.frame.size.width, height: self.frame.size.height / 2)
        grabbableViewAlpha.updateImageViewConstraints()
        grabbableViewBeta.testModifyingConstraintsConstants(top: self.frame.size.height / 2, left: 0, width: self.frame.size.width, height: self.frame.size.height / 2)
        grabbableViewBeta.updateImageViewConstraints()
 
        
        print("viewWillMove")
        print("viewFrame: \(self.view.frame.origin.x),\(self.view.frame.origin.y), \(self.view.frame.size.width), \(self.view.frame.size.height)")
        print("viewFrame2: \(self.frame.origin.x),\(self.frame.origin.y), \(self.frame.size.width), \(self.frame.size.height)")
    }
    
}

extension LayoutEditingView_Type1: GrabDelegate {
    func viewDidGrabbed(grabbableView: GrabbableWindowScrollView) {
        
    }
    
    func viewDidMove(grabbableView: GrabbableWindowScrollView, delta: CGPoint) {
        
        grabbableView.update(offsetDelta: delta)
    }
    
    func viewDidDropped(grabbableView: GrabbableWindowScrollView) {
        
    }
}

/*
extension LayoutEditingView_Type1: LayoutEditingSizeControlProtocol {
    
    func shouldMove(sizeControl: LayoutEditingSizeControl, delta: CGPoint, currentCenterOffset: CGPoint) -> Bool {
        
        /*
         The size control must stay in the boundRect. Otherwise, the
         movement must not be allowed.
         */
        let newCenterWillBe = CGPoint(x: delta.x + currentCenterOffset.x + self.bounds.midX,
                                      y: delta.y + currentCenterOffset.y + self.bounds.midY)
        var boundRect = CGRect.zero
        
        if sizeControl === self.sizeControlAlpha {
            boundRect = CGRect(x: 0, y: 50,
                               width: splitViewSize.width,height: splitViewSize.height - 100)

        } else {
            return false
        }
        
        return boundRect.contains(newCenterWillBe)
    }
    
    func didMove(sizeControl: LayoutEditingSizeControl, delta: CGPoint) {
        
        if sizeControl === self.sizeControlAlpha {
            
            self.splitViewAlpha.update(sizeDelta: CGSize(width: 0, height: delta.y))
            
            self.splitViewBeta.update(offsetDelta: CGPoint(x: 0, y: delta.y))

            self.splitViewBeta.update(sizeDelta: CGSize(width: 0, height: -delta.y))
            
        }
    }
}
*/
