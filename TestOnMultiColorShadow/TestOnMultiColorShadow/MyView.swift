//
//  MyView.swift
//  TestOnMultiColorShadow
//
//  Created by SeoGiwon on 22/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyView: UIView {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var imgViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgViewHeightConstraint: NSLayoutConstraint!
    
    
    func activateImgView(activated: Bool) {
        
        imgViewWidthConstraint.constant = activated ? 250 : 150
        imgViewWidthConstraint.constant = activated ? 250 : 150
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    
}
