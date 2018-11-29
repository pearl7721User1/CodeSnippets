//
//  MomentsDataSourceElement.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by SeoGiwon on 28/11/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

struct MomentsDataSourceElement {

    let phAssetCollection: PHAssetCollection
    var phAssets = [PHAsset]()
    
    static func momentsDataSourceElement(of phAssetCollectionFetchResult: PHAssetCollection, filteredFrom allPHAssets: [PHAsset]) -> MomentsDataSourceElement? {
        
        // get startdate, enddate
        guard let startDate = phAssetCollectionFetchResult.startDate,
            let endDate = phAssetCollectionFetchResult.endDate else {
                return nil
        }

        let filteredPHAssets = allPHAssets.filter { (phAsset: PHAsset) -> Bool in
            
            if let creationDate = phAsset.creationDate {
                
                if creationDate < endDate && creationDate > startDate {
                    return true
                }
            }
            
            return false
            
        }

        let element = MomentsDataSourceElement(phAssetCollection: phAssetCollectionFetchResult, phAssets: allPHAssets)
        return element
    }
    
}
