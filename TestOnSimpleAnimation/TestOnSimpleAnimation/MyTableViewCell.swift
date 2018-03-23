//
//  MyTableViewCell.swift
//  TestOnSimpleAnimation
//
//  Created by GIWON1 on 2018. 3. 23..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var theView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    

    func animation() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
        }, completion: {
            (finished) in
            print("Done🔨")
            
        })
 
        
    
    }
}
