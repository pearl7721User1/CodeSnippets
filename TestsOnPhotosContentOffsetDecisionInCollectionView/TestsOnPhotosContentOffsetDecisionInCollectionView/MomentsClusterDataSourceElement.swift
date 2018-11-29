//
//  MomentsClusterDataSourceElement.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by GIWON1 on 2018. 11. 29..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

struct MomentsClusterDataSourceElement {
    
    let phCollectionList: PHCollectionList
    var phAssets = [PHAsset]()
    
    static func MomentsClusterDataSourceElement(of phCollectionList: PHCollectionList, from allPHAssets: [PHAsset]) -> MomentsClusterDataSourceElement? {
        
        guard let startDate = phCollectionList.startDate,
            let endDate = phCollectionList.endDate else {
                return nil
        }
        
        // filter
        let filteredPHAssets = allPHAssets.filter { (phAsset: PHAsset) -> Bool in
            
            if let creationDate = phAsset.creationDate {
                
                if creationDate < endDate && creationDate > startDate {
                    return true
                }
            }
            
            return false
        }
        
        let theStructure = MomentsClusterDataSourceElement(of: phCollectionList, from: allPHAssets)
        return theStructure
    }
}
