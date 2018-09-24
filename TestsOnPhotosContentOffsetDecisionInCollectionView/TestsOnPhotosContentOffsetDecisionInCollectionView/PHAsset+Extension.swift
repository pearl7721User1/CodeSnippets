//
//  PHAsset+Extension.swift
//  PhotokitMomentsTesting
//
//  Created by GIWON1 on 2018. 2. 1..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

extension PHAsset {
    static func assetsOfCreationDateStarting(from fromDate:Date, to toDate:Date,
                                              in fetchResult: PHFetchResult<PHAsset>) -> [PHAsset] {

        var phAssets = [PHAsset]()

        // enumerate over fetchResult
        fetchResult.enumerateObjects({ (asset, index, stop) in
            
            if let creationDate = asset.creationDate {
                
                if [ComparisonResult.orderedSame, ComparisonResult.orderedAscending].contains(fromDate.compare(creationDate)) &&
                    [ComparisonResult.orderedSame, ComparisonResult.orderedDescending].contains(toDate.compare(creationDate)) {
                    
                    phAssets.append(asset)
                }
            }
        })
        
        return phAssets
    }
    
    static func indexesOfCreationDateStarting(from fromDate:Date, to toDate:Date,
                                             in fetchResult: PHFetchResult<PHAsset>) -> IndexSet {
        
        var indexes = [Int]()
        
        // enumerate over fetchResult
        fetchResult.enumerateObjects({ (asset, index, stop) in
            
            if let creationDate = asset.creationDate {
                
                if [ComparisonResult.orderedSame, ComparisonResult.orderedAscending].contains(fromDate.compare(creationDate)) &&
                    [ComparisonResult.orderedSame, ComparisonResult.orderedDescending].contains(toDate.compare(creationDate)) {
                    
                    indexes.append(index)
                }
            }
        })
        
        return IndexSet(indexes)
    }
}
