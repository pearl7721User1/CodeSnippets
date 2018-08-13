//
//  LaunchViewController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 20/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    lazy var myNavigationController: MyNavigationController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MyNavigationController") as! MyNavigationController
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setViewHierarchy()
    }
    
    func setViewHierarchy() {
        
        // add mainTabBarController to launchViewController
        self.addChildViewController(myNavigationController)
        self.view.addSubview(myNavigationController.view)
        
        // have mainTabBarController's view bounded by launchViewController's view
        myNavigationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        myNavigationController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        myNavigationController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        myNavigationController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        myNavigationController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // set launchViewController's view hierarchy
        self.view.bringSubview(toFront: toolbar)
    }
    
    @IBAction func pushBtnTapped(_ sender: UIBarButtonItem) {
        myNavigationController.performTransitionToBlueViewController()
    }
    
    @IBAction func presentBtnTapped(_ sender: UIBarButtonItem) {
        myNavigationController.performPresentGreenViewController()
    }
    
    
}
