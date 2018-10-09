//
//  ViewController.swift
//  TestsOnButtonStateTransition
//
//  Created by SeoGiwon on 09/10/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isPlaying = false
    
    @IBAction func touchUpInside(_ sender: MyButton) {
        print("touchUpInside")
        isPlaying = isPlaying ? false : true
        sender.showPlayIcon(isPlaying: isPlaying)
    }

}

