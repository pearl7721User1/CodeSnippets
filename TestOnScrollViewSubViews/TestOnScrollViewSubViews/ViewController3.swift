//
//  ViewController3.swift
//  TestOnScrollViewSubViews
//
//  Created by SeoGiwon on 29/08/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var pileCollectionView: PileCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        
        
        let v = UIView()
        v.backgroundColor = UIColor.yellow
        v.frame = CGRect(x: 30, y: 30, width: 200, height: 50)
        self.view.addSubview(v)
        
        v.layer.masksToBounds = false
        v.layer.shadowColor = UIColor.black.cgColor
//        v.layer.shadowOffset = CGSize(width: 10, height: 10)
        v.layer.shadowOpacity = 1.0
//        v.layer.shadowRadius = 20
        
        let path = UIBezierPath(roundedRect:
            CGRect(origin: CGPoint(x: 0, y: -5), size: CGSize(width: v.bounds.width, height: v.bounds.height+5)),
                                byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        
        // TODO: - dynamical corner radius size needed
        
        v.layer.shadowPath = path.cgPath
        
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
