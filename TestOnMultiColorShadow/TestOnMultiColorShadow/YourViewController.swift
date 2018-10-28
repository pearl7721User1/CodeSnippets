//
//  YourViewController.swift
//  TestOnMultiColorShadow
//
//  Created by SeoGiwon on 22/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class YourViewController: UIViewController {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var bgImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftBtnTapped(_ sender: UIButton) {
        visualEffectView.isHidden = true
        bgImgView.isHidden = true
        
    }
    
    @IBAction func rightBtnTapped(_ sender: UIButton) {
        visualEffectView.isHidden = false
        bgImgView.isHidden = false
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
