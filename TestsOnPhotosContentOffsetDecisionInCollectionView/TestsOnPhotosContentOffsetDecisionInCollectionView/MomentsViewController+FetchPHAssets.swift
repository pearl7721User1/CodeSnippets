//
//  MomentsViewController+FetchPHAssets.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by SeoGiwon on 11/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

extension MomentsViewController {
    
    // MARK: - Initial Fetching on Launch
    func fetchAllMoments() -> PHFetchResult<PHAsset> {
        
        // PHFetchOptions of creationDate ascending
        let creationDateFetchOption: PHFetchOptions = {
            
            let options = PHFetchOptions()
            options.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: true)]
            return options
        }()
        
        // fetch all moments PHAssets
        let assetFetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: creationDateFetchOption)
        
        return assetFetchResult
    }
    
    func fetchAllMomentsCollection() -> PHFetchResult<PHAssetCollection> {
        
        // PHFetchOptions of startDate ascending
        let startDateFetchOption: PHFetchOptions = {
            
            let options = PHFetchOptions()
            options.sortDescriptors = [NSSortDescriptor(key:"startDate", ascending: true)]
            return options
        }()
        
        // fetch all moments PHAssetCollections
        let assetCollectionsFetchResult: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchMoments(with: startDateFetchOption)
        return assetCollectionsFetchResult
    }
}
