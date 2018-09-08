//
//  ViewController.swift
//  TestsOnChainedConstraints
//
//  Created by SeoGiwon on 08/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pileCollectionView = PileCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.view.addSubview(pileCollectionView)
        
        
        pileCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pileCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pileCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        pileCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pileCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        pileCollectionView.pushPile()
        
    }



}

