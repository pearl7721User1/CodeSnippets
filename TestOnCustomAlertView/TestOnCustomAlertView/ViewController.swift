//
//  ViewController.swift
//  TestOnCustomAlertView
//
//  Created by SeoGiwon on 22/05/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertControllerBtnTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "title", message: "msg", preferredStyle: .alert)
        let action = UIAlertAction(title: "altl", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
}

