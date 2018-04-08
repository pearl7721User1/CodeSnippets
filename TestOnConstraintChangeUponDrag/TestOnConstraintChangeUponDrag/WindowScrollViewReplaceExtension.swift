//
//  WindowScrollViewReplaceExtension.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 08/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

extension WindowScrollView {
    
    func replaceConstraintsConstant(top: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        viewTopConstraint.constant = top
        viewLeftConstraint.constant = left
        viewWidthConstraint.constant = width
        viewHeightConstraint.constant = height
    }
    
    
}

