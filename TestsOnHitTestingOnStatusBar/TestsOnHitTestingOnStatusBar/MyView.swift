//
//  MyView.swift
//  TestsOnHitTestingOnStatusBar
//
//  Created by SeoGiwon on 08/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.green
        
        let tg = UITapGestureRecognizer(target: self, action: #selector(doSomething))
        self.addGestureRecognizer(tg)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        return self
        
        print("pt:\(point.x) ,\(point.y)")
        let rt = CGRect(x: 0, y: 0, width: self.bounds.width, height: 50)
        
        print("rt:0, 0, \(rt.width) ,\(rt.height)")
        
        if (rt.contains(point)) {
            return self
        } else {
            return nil
        }
        
    }
 
    @objc func doSomething() {
        print("doSomething")
    }
}
