//
//  ViewController.swift
//  TestsOnScrollViewSubViews
//
//  Created by SeoGiwon on 03/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var myScrollView: SplitUpScrollView = { return SplitUpScrollView() }()
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        myScrollView.frameDescription()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(myScrollView)
        
        
        myScrollView.setupConstraints(superview: self.view, size:
            CGSize(width: 150,
                   height: 200),
                                        offset: CGPoint(x: 100, y: 200))
        
        myScrollView.backgroundColor = UIColor.red
        let myScrollViewAlphaFrame = CGRect(x: 0, y: 0, width: 150, height: 200)
        
        myScrollView.imageFrameSize = myScrollViewAlphaFrame.size
        myScrollView.image = UIImage.init(named: "cat.jpeg")
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

