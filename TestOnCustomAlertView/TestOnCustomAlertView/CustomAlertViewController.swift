//
//  CustomAlertViewController.swift
//  TestOnCustomAlertView
//
//  Created by SeoGiwon on 22/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        alertView.layer.cornerRadius = 10.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
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
