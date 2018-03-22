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
        // Do any additional setup after loading the view, typically from a nib.
        /*
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageSize.height, imageSize.width), YES, 1.0);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(ctx, 0, imageSize.width);
        CGContextScaleCTM(ctx, 1, -1);
        
        CGContextDrawImage(ctx, CGRectMake(0.0, 0.0, imageSize.height, imageSize.width), image.CGImage);
        image = UIGraphicsGetImageFromCurrentImageContext();
        imageData = UIImageJPEGRepresentation(image, 1.0);
        UIGraphicsEndImageContext();
 */
        
        let image: UIImage! = UIImage(named: "IMG_5254.jpg")
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>), <#T##opaque: Bool##Bool#>, <#T##scale: CGFloat##CGFloat#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
