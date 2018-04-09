//
//  WindowScrollViewReplaceExtension.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 08/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

extension WindowScrollView {
    
    func constraintValues() -> [CGFloat] {
        
        return [viewTopConstraint.constant, viewLeftConstraint.constant, viewWidthConstraint?.constant ?? 0, viewHeightConstraint?.constant ?? 0]
    }
    
    func setConstraintValues(values: [CGFloat]) {
        
        guard values.count == 4 else {
            print("setConstraintValues wrong values")
            return
        }
        
        viewTopConstraint.constant = values[0]
        viewLeftConstraint.constant = values[1]
        viewWidthConstraint?.constant = values[2]
        viewHeightConstraint?.constant = values[3]
        
        UIView.animate(withDuration: 1.0) {
            self.layoutIfNeeded()
        }
    }
    
    
}
