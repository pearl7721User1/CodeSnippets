//
//  RedViewController.swift
//  TestOnTransitionDelegate
//
//  Created by SeoGiwon on 14/07/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
/*
        
        let view5 = UIView(frame: CGRect(x: 100, y: 100, width: 170, height: 100))
//        view5.backgroundColor = UIColor.blue
        
        view5.layer.contents = UIImage(named: "img1.jpeg")?.cgImage
        view5.contentMode = .scaleAspectFit
        self.view.addSubview(view5)
*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateBtnTapped(_ sender: UIBarButtonItem) {
        
        if let myNavigationController = self.navigationController as? MyNavigationController {
            
            myNavigationController.performTransitionToBlueViewController(from: self, with: transitionInfo())
        }
    }
    
    private func transitionInfo() -> MyTransitionInfo {
        
        let fromFrame1 = imgView.frame
        let fromFrame2 = imgView2.frame
        let fromFrame3 = imgView3.frame
        let fromFrame4 = imgView4.frame
        
        let size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height / 4.0)
        
        let toFrame1 = CGRect(origin: CGPoint.zero, size: size)
        let toFrame2 = CGRect(origin: CGPoint(x: toFrame1.minX, y: toFrame1.maxY), size: size)
        let toFrame3 = CGRect(origin: CGPoint(x: toFrame2.minX, y: toFrame2.maxY), size: size)
        let toFrame4 = CGRect(origin: CGPoint(x: toFrame3.minX, y: toFrame3.maxY), size: size)
        
        
        let myTransitionInfo = MyTransitionInfo(views: [UIView(), UIView(), UIView(), UIView()],
                                                images: [UIImage(named: "img1.jpeg")!, UIImage(named: "img2.jpeg")!, UIImage(named: "img3.jpeg")!, UIImage(named: "img4.jpg")!],
                                                fromFrames: [fromFrame1, fromFrame2, fromFrame3, fromFrame4], toFrames: [toFrame1, toFrame2, toFrame3, toFrame4])

        return myTransitionInfo
        
    }

}
