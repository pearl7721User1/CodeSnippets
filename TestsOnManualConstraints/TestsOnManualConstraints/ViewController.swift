//
//  ViewController.swift
//  TestsOnManualConstraints
//
//  Created by SeoGiwon on 26/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createView()
    }

    func createView() {
        let view = UIView()
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.yellow
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let leftConstraint = NSLayoutConstraint(item: self.view, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: -50)
        
        leftConstraint.isActive = true
        
    }


}

