//
//  PopupViewController.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by SeoGiwon on 11/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

class PopupViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var photosPositioningDelegate: MomentsScrollToPosition?
    var allMomentsFetchResult: PHFetchResult<PHAsset>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let fetchResult = allMomentsFetchResult {
            return fetchResult.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        
        if let phAsset = allMomentsFetchResult?.object(at: indexPath.row) {
            
            
            PHImageManager().requestImage(for: phAsset, targetSize: CGSize(width: 50, height: 50), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
                
                if let imgView = cell.viewWithTag(10) as? UIImageView {
                    imgView.image = image
                }
            })
            
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let phAsset = allMomentsFetchResult?.object(at: indexPath.row) {            
            if let delegate = photosPositioningDelegate {
                
                self.dismiss(animated: true, completion: {
                    delegate.scroll(for: phAsset)
                })                
            }
        }
    }
}
