//
//  ViewController.swift
//  TestsOnCoreGraphics
//
//  Created by GIWON1 on 2018. 3. 12..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     

        
        let image: UIImage! = UIImage(named: "cat.jpeg")

        let dstImage = self.coreGraphicsOperation(srcImage: image, zoomVector: CGSize(width:1.0, height:1.0), cropRect: CGRect.zero)
        
        let imgView = UIImageView(image: dstImage)
        self.view.addSubview(imgView)
        imgView.center = self.view.center

        

/*
        let imgView = UIImageView(image: image)
        imgView.sizeToFit()
        self.view.addSubview(imgView)
        imgView.center = self.view.center
        
        let f = imgView.frame
*/
    }
    
    func coreGraphicsOperation(srcImage: UIImage, zoomVector: CGSize, cropRect:CGRect) -> UIImage {
        
        let theRectSize = CGSize(width: srcImage.size.width * zoomVector.width,
                                 height: srcImage.size.height * zoomVector.height)
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)

        let ctx = UIGraphicsGetCurrentContext()
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
//        imageData = UIImageJPEGRepresentation(image, 1.0);
        
        UIGraphicsEndImageContext();
        
        return image!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
