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
    @IBAction func btnResize(_ sender: UIBarButtonItem) {
        dstImage = self.resize(srcImage: sourceImage, zoomVector: CGSize(width:1.5, height:1.5))
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
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width:theRectSize.height, height:theRectSize.width), true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.rotate(by: CGFloat((Double.pi / 180) * 90))
        ctx?.translateBy(x: 0, y: -theRectSize.height)
        
        ctx?.translateBy(x: 0, y: theRectSize.height)
        ctx?.scaleBy(x: 1, y: -1)
        
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    func resize(srcImage: UIImage, zoomVector: CGSize) -> UIImage {
        
        // if zoomVector isn't valid, return the source image right away
        
        // otherwise,
        let theRectSize = CGSize(width: srcImage.size.width / zoomVector.width,
                                 height: srcImage.size.height / zoomVector.height)
        
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.translateBy(x: 0, y: theRectSize.height)
        ctx?.scaleBy(x: 1, y: -1)
        
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    func crop(srcImage: UIImage, cropRect: CGRect) -> UIImage {
        
        // if cropRect isn't valid, return the source image right away
        
        // otherwise,
        let theRectSize = CGSize(width: srcImage.size.width,
                                 height: srcImage.size.height)
        
        let theCropRect = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        UIGraphicsBeginImageContextWithOptions(theRectSize, true, 1.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.translateBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        
        ctx?.translateBy(x: 0, y: theRectSize.height)
        ctx?.scaleBy(x: 1, y: -1)
        
        ctx?.draw(srcImage.cgImage!, in: CGRect(origin: CGPoint.zero, size: theRectSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!
    }
    
}
