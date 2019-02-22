//
//  ViewController.swift
//  TestsOnScrollRectToVisibleWithImage
//
//  Created by SeoGiwon on 03/02/2019.
//  Copyright © 2019 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func presentButtonTapped(_ sender: UIBarButtonItem) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageEmbedScrollViewPresentationViewController") as! ImageEmbedScrollViewPresentationViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
}

