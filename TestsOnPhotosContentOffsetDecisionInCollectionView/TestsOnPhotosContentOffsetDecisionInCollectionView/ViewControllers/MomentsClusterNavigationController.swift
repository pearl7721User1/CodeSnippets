//
//  MomentsClusterNavigationController.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by GIWON1 on 2018. 11. 29..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

class MomentsClusterNavigationController: UINavigationController {

    var allMomentsProvider: AllMomentsProvider?
    
    func initAllMomentsProvider() {
        self.allMomentsProvider = AllMomentsProvider()
    }
    
    
    
}
