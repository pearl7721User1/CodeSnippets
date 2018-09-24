//
//  MomentsViewHelper.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by SeoGiwon on 15/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

class MomentsViewHelper {
    
    private let indexPathArray: [IndexPath]
    
    init(collectionFetchResult: PHFetchResult<PHAssetCollection>) {
        
        var arrayA = [IndexPath]()
        collectionFetchResult.enumerateObjects { (collection, idx, stop) in
            for i in 0..<collection.estimatedAssetCount {
                let indexPath = IndexPath(item: i, section: idx)
                arrayA.append(indexPath)
            }
        }
        
        indexPathArray = arrayA
    }
    
    func indexPath(from phAsset:PHAsset, in phAssetFetchResult: PHFetchResult<PHAsset>) -> IndexPath? {
        
        // find out the index of the given phAsset in the fetchresult
        let idx = phAssetFetchResult.index(of: phAsset)
        
        // find indexpath with the index
        return indexPathArray[idx]
    }
    
    func phAsset(from indexPath:IndexPath, in phAssetFetchResult: PHFetchResult<PHAsset>) -> PHAsset? {
        
        guard let idx = indexPathArray.index(of: indexPath) else {
            return nil
        }
        
        return phAssetFetchResult.object(at: idx)
    }
}
