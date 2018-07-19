//
//  MyScrollViewController.swift
//  TestOnCustomScrollView
//
//  Created by SeoGiwon on 18/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class MyScrollViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
       return UIScrollView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(scrollView)
        
        scrollView.backgroundColor = UIColor.blue
        
        scrollView.addSubview(dummyView(origin: CGPoint.zero))
        scrollView.addSubview(dummyView(origin: CGPoint(x: 200, y: 0)))
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    private func dummyView(origin: CGPoint) -> UIView {
        
        let view = UIView()
        view.frame = CGRect(origin: origin, size: CGSize(width: 150, height: 150))
        view.backgroundColor = UIColor.yellow
        return view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
