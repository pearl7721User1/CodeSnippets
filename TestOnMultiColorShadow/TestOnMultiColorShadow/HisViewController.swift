//
//  HisViewController.swift
//  TestOnMultiColorShadow
//
//  Created by GIWON1 on 2018. 11. 16..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit

class HisViewController: UIViewController {

    @IBOutlet weak var shadeView: ImageShadeEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1Tapped(_ sender: UIButton) {
        shadeView.function1()
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        shadeView.function2()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
