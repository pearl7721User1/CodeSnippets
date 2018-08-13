//
//  ViewController.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 13/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(scrollView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let v1 = subView(color: UIColor.red)
        let v2 = subView(color: UIColor.blue)
        let v3 = subView(color: UIColor.green)
 
        v1.frame.origin = CGPoint(x: 0, y: 0)
        v2.frame.origin = CGPoint(x: 0, y: 50)
        v3.frame.origin = CGPoint(x: 0, y: 100)
        
        scrollView.addSubview(v1)
        scrollView.addSubview(v2)
        scrollView.addSubview(v3)
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + 150)
    }
    
    private func subView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        return view
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.frame = self.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

