//
//  ImageEmbedScrollViewPresentationViewController.swift
//  TestsOnScrollRectToVisibleWithImage
//
//  Created by SeoGiwon on 03/02/2019.
//  Copyright © 2019 SeoGiwon. All rights reserved.
//

import UIKit

class ImageEmbedScrollViewPresentationViewController: UIViewController {

    @IBOutlet weak var splitScrollView: SplitScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b0ButtonTapped(_ sender: UIBarButtonItem) {
        splitScrollView.reflectInitialVisibleRect(rect: CGRect.zero)
    }
    
    @IBAction func b1ButtonTapped(_ sender: UIBarButtonItem) {
        print("================================")
        print("scrollViewSize:\(splitScrollView.bounds.size.width),h: \(splitScrollView.bounds.size.height)")
        print("aspectFillSize:\(splitScrollView.imageSizeForThisViewFrame().width), h:\(splitScrollView.imageSizeForThisViewFrame().height)")
        
        print("contentSizeWidth: \(splitScrollView.contentSize.width), height:\(splitScrollView.contentSize.height)")
        print("contentOffsetX: \(splitScrollView.contentOffset.x), Y:\(splitScrollView.contentOffset.y)")
        splitScrollView.reflectInitialVisibleRect(rect: CGRect.init(x: 60, y: 60, width: 180, height: 68))
        print("contentSizeWidth: \(splitScrollView.contentSize.width), height:\(splitScrollView.contentSize.height)")
        print("contentOffsetX: \(splitScrollView.contentOffset.x), Y:\(splitScrollView.contentOffset.y)")
    }
    
    @IBAction func b2ButtonTapped(_ sender: UIBarButtonItem) {
        
        
        let newFrame = CGRect.init(x: 0, y: 150, width: 240, height: 60)

        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            self.splitScrollView.frame = newFrame
            
            print(self.splitScrollView.contentSize.height / 2.0 - self.splitScrollView.bounds.height/2.0)
            
            self.splitScrollView.setContentOffset(CGPoint(x: 0, y: self.splitScrollView.contentSize.height / 2.0 - self.splitScrollView.bounds.height/2.0), animated: false)
        }, completion: { finished in
//            self.splitScrollView.setContentOffset(CGPoint(x: 0, y: 15), animated: false)
        })
        
        
    }
    
    @IBAction func b3ButtonTapped(_ sender: UIBarButtonItem) {
        let newFrame = CGRect.init(x: 0, y: 150, width: 240, height: 128)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
            self.splitScrollView.frame = newFrame
        }, completion: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func scrollButtonTapped(_ sender: UIBarButtonItem) {
        
        
        
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
