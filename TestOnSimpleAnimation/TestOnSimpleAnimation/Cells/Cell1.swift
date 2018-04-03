//
//  MyTableViewCell.swift
//  TestOnSimpleAnimation
//
//  Created by GIWON1 on 2018. 3. 23..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class Cell1: UITableViewCell {

    @IBOutlet weak var theView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
    }

    func animation() {
        
        topConstraint.constant = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.layoutIfNeeded()
            
        }, completion: {
            (finished) in
        })
 
        
    
    }
}
