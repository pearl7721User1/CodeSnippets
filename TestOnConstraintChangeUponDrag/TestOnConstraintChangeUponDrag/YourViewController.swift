//
//  YourViewController.swift
//  TestOnConstraintChangeUponDrag
//
//  Created by SeoGiwon on 14/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class YourViewController: UIViewController {

    @IBOutlet weak var sizeControlAlpha: WindowScrollViewSizeControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sizeControlAlpha.delegate = self
    }
    @IBAction func changeSizeBtn(_ sender: UIButton) {
        
        switch sizeControlAlpha.controlType {
        case .horizontal:
            sizeControlAlpha.update(sizeDelta: CGSize(width: 30, height:0))
        case .vertical:
            sizeControlAlpha.update(sizeDelta: CGSize(width: 0, height:30))
        case .both:
            break
        }
        
    }
    @IBAction func changeToVerticalBtn(_ sender: UIButton) {
        
        sizeControlAlpha.controlType = .vertical
    }
    @IBAction func changeToHorizontalBtn(_ sender: UIButton) {
        
        sizeControlAlpha.controlType = .horizontal
    }
    @IBAction func changeToBoth(_ sender: UIButton) {
        
        sizeControlAlpha.controlType = .both
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

extension YourViewController: WindowScrollViewSizeControlProtocol {
    
    func shouldMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint) -> Bool {
        
        return true
    }
    
   
    func didMove(sizeControl: WindowScrollViewSizeControl, delta: CGPoint) {
        
        
    }
}
