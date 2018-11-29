//
//  AllMomentsProvider.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by GIWON1 on 2018. 11. 29..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

class AllMomentsProvider {

    private(set) var allMomentsFetchResult: PHFetchResult<PHAsset>?

    init() {
        
        // PHFetchOptions of creationDate ascending
        let creationDateFetchOption: PHFetchOptions = {
            
            let options = PHFetchOptions()
            options.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: true)]
            return options
        }()
        
        // fetch all moments PHAssets
        let assetFetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: creationDateFetchOption)
        
        self.allMomentsFetchResult = assetFetchResult
    }
    
}
