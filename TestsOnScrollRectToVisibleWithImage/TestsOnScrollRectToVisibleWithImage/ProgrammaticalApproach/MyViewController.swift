//
//  MyViewController.swift
//  TestsOnScrollRectToVisibleWithImage
//
//  Created by SeoGiwon on 03/02/2019.
//  Copyright © 2019 SeoGiwon. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var horizontalSizeControlPositions: [CGFloat] = [0.25, 0.5, 0.75]
    
    
    private var hSCs = [UIView]()
    private var hSCTopConstraints = [NSLayoutConstraint]()
    private var splitViews = [UIView]()
    
    
    private var isViewFirstTimeAppeared = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hSCs = createSizeControlsAndBuildViewHierarchy(sizeControlTotal: horizontalSizeControlPositions.count)
        self.hSCTopConstraints = topConstraints(sizeControls: self.hSCs)
        
        guard self.hSCs.count == self.hSCTopConstraints.count else {
            fatalError()
        }
        
        self.splitViews = createSplitViewsAndBuildViewHierarchy(against: self.hSCs)
        fillIn(splitViews: self.splitViews, against: hSCs)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (isViewFirstTimeAppeared) {
            
            
            for (i,constraint) in hSCTopConstraints.enumerated() {
                
                let position = horizontalSizeControlPositions[i]
                
                constraint.isActive = true
                constraint.constant = self.view.bounds.height * position
            }
            
            isViewFirstTimeAppeared = false
        }
    }
    
    private func createSplitViewsAndBuildViewHierarchy(against sizeControls:[UIView]) -> [UIView] {

        var viewNumbers = sizeControls.count + 1
        var splitViews = [UIView]()
        
        for i in 1...viewNumbers {
            let view = UIView()
            view.backgroundColor = UIColor.blue
            self.view.addSubview(view)
            
            splitViews.append(view)
        }
        
        return splitViews
    }
    
    private func fillIn(splitViews: [UIView], against sizeControls:[UIView]) {
        
        for (i,splitView) in splitViews.enumerated() {
            
            var topAnchorView: UIView!
            var bottomAnchorView: UIView!
            
            if i<splitViews.count-1 {
                bottomAnchorView = sizeControls[i]
            } else {
                bottomAnchorView = self.view
            }
            
            if i>0 {
                topAnchorView = sizeControls[i-1]
            } else {
                topAnchorView = self.view
            }
            
            splitView.translatesAutoresizingMaskIntoConstraints = false
            splitView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            splitView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            
            
            
            splitView.topAnchor.constraint(equalTo: topAnchorView == self.view ? topAnchorView.topAnchor : topAnchorView.bottomAnchor).isActive = true
            splitView.bottomAnchor.constraint(equalTo: bottomAnchorView == self.view ? bottomAnchorView.bottomAnchor : bottomAnchorView.topAnchor).isActive = true
            
        }
        
        
    }
    
    private func createSizeControlsAndBuildViewHierarchy(sizeControlTotal: Int) -> [UIView] {
        
        var sizeControls = [UIView]()
        
        for _ in 1...sizeControlTotal {
            let sizeControl = UIView()
            sizeControl.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(sizeControl)
            sizeControl.backgroundColor = UIColor.green
            sizeControl.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            sizeControl.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            sizeControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
            sizeControls.append(sizeControl)
        }
        
        return sizeControls
    }
    
    private func topConstraints(sizeControls: [UIView]) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        
        for (_,sizeControl) in sizeControls.enumerated() {
            
            let TopConstraint = sizeControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 1)
            constraints.append(TopConstraint)
        }
        
        return constraints
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
