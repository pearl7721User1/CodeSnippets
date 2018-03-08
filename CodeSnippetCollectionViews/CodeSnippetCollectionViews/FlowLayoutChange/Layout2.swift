//
//  Layout2.swift
//  CollectionViewTest
//
//  Created by SeoGiwon on 1/10/17.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

class Layout2: UICollectionViewFlowLayout {

    override init() {
        
        super.init()
        self.itemSize = CGSize(width: 60, height: 60)
        self.minimumInteritemSpacing = 0.0
        self.minimumLineSpacing = 5.0
        
        self.headerReferenceSize = CGSize(width: 30, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
