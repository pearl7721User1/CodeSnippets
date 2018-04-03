//
//  ViewController.swift
//  TestsOnCoreGraphics
//
//  Created by GIWON1 on 2018. 3. 12..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    //let sourceImage: UIImage! = UIImage(named: "cat.jpeg")
    let sourceImage: UIImage! = UIImage(named: "cat2.jpg")
    
    var dstImage: UIImage? {
        didSet {
            imageView.image = dstImage
            imageView.sizeToFit()
            imageView.center = self.view.center//CGPoint(x:self.view.bounds.midX, y:self.view.bounds.midY)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        self.view.addSubview(imageView)
//        let dstImage = self.coreGraphicsOperation(srcImage: sourceImage, zoomVector: CGSize(width:1.0, height:1.0), cropRect: CGRect.zero)

        

/*
        let imgView = UIImageView(image: image)
        imgView.sizeToFit()
        self.view.addSubview(imgView)
        imgView.center = self.view.center
        
        let f = imgView.frame
*/
    }
    
    
    
    
    @IBAction func btnOriginal(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "OriginalImageViewController", sender: self)
    }
    @IBAction func btnMirror(_ sender: UIBarButtonItem) {
        
        dstImage = self.mirror(srcImage: sourceImage)
    }
    @IBAction func btnFlip(_ sender: UIBarButtonItem) {
        
        dstImage = self.flip(srcImage: sourceImage)
    }
    @IBAction func btnClockwiseRotate(_ sender: UIBarButtonItem) {
        
        dstImage = self.clockWiseRotate(srcImage: sourceImage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier,
            identifier == "OriginalImageViewController" {
            
            (segue.destination as! OriginalImageViewController).image = sourceImage
        }
    }
    

}

extension ViewController {
    
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
    
    func mirror(srcImage: UIImage) -> UIImage {
        
        let theRectSize = CGSize(width: srcImage.size.width,
                                 height: srcImage.size.height)
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        // The y-axis of core graphics context coordinate space is upside down. It has to be reversed.
        ctx?.translateBy(x: 0, y: theRectSize.height)
        ctx?.scaleBy(x: 1, y: -1)

        // mirror
        ctx?.translateBy(x: theRectSize.width, y: 0)
        ctx?.scaleBy(x: -1, y: 1)
        
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    func flip(srcImage: UIImage) -> UIImage {
        
        let theRectSize = CGSize(width: srcImage.size.width,
                                 height: srcImage.size.height)
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        // The y-axis of core graphics context coordinate space is upside down from the beginning. Doing nothing will flip the image.
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    func clockWiseRotate(srcImage: UIImage) -> UIImage {
        
        let theRectSize = CGSize(width: srcImage.size.width,
                                 height: srcImage.size.height)
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        // The y-axis of core graphics context coordinate space is upside down. It has to be reversed.
        ctx?.translateBy(x: 0, y: theRectSize.height)
        ctx?.scaleBy(x: 1, y: -1)
        
        ctx?.rotate(by: CGFloat(Double.pi / 2))
        
        
        
        // The y-axis of core graphics context coordinate space is upside down from the beginning. Doing nothing will flip the image.
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
}
