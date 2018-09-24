//
//  ViewController.swift
//  TestsOnRoundingCorners
//
//  Created by SeoGiwon on 11/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view1 = aView(with: UIColor.green)
        view1.tag = 10
        self.view.addSubview(view1)
        setConstraints(for: view1, topView: nil, margin: 50, superView: self.view)
        
        let view2 = aView(with: UIColor.blue)
        view2.tag = 11
        self.view.addSubview(view2)
        setConstraints(for: view2, topView: view1, margin: 50, superView: self.view)
        
        let view3 = aView(with: UIColor.yellow)
        view3.tag = 12
        self.view.addSubview(view3)
        setConstraints(for: view3, topView: view2, margin: 50, superView: self.view)
        
        let view4 = aView(with: UIColor.orange)
        view4.tag = 13
        self.view.addSubview(view4)
        setConstraints(for: view4, topView: view3, margin: 50, superView: self.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let view1 = self.view.viewWithTag(10)
        let view2 = self.view.viewWithTag(11)
        let view3 = self.view.viewWithTag(12)
        let view4 = self.view.viewWithTag(13)
        
        sugar(view: view1)
        sugar(view: view2)
        sugar(view: view3)
        sugar(view: view4)
    }

    private func sugar(view: UIView?) {
        
        guard let view = view else {
            return
        }
        
        print(view.tag)
        
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: -3)
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
    }
    
    private func aView(with color:UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }

    private func setConstraints(for view:UIView, topView:UIView?, margin:CGFloat, superView:UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if topView == nil {
            view.topAnchor.constraint(equalTo: superView.topAnchor, constant:margin).isActive = true
        } else {
            view.topAnchor.constraint(equalTo: topView!.topAnchor, constant: margin).isActive = true
        }
        
        view.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: superView.bounds.height).isActive = true
        
    }

}

