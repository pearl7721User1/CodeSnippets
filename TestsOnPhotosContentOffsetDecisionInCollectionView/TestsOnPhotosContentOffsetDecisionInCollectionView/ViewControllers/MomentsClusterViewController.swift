//
//  MomentsClusterViewController.swift
//  TestsOnPhotosContentOffsetDecisionInCollectionView
//
//  Created by GIWON1 on 2018. 11. 29..
//  Copyright © 2018년 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

class MomentsClusterViewController: UIViewController, UICollectionViewDataSource {
    
    private var dataSource: [MomentsClusterDataSourceElement]?
    private var allPHCollectionLists: PHFetchResult<PHCollectionList>?
    
    private func createDataSource() {
        
        // fetch all moments PHAssetCollections
        let startDateFetchOption: PHFetchOptions = {
            
            let options = PHFetchOptions()
            options.sortDescriptors = [NSSortDescriptor(key:"startDate", ascending: true)]
            return options
        }()        
        
        // fetch all moments cluster PHCollection Lists
        let clusterCollectionListsFetchResult: PHFetchResult<PHCollectionList> = PHCollectionList.fetchMomentLists(with: .momentListCluster, options: startDateFetchOption)
        
    }
    
    // collection view for displaying the asset thumbnails
    @IBOutlet weak var collectionView: MomentsCommonCollectionView!
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewType = .MomentsCluster

        // fetch all moments
        if let momentsClusterNavigationController = self.navigationController as? MomentsClusterNavigationController {
            
            momentsClusterNavigationController.initAllMomentsProvider()
        }
        
        self.createDataSource()
        
        
    }
    
    
    
    // MARK: - CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GridViewCell.self), for: indexPath) as? GridViewCell else { fatalError("failed to dequeue GridViewCell") }
        
        cell.backgroundColor = UIColor.red
        /*
        guard allMomentsFetchResult != nil,
            momentsViewHelper != nil,
            let phAsset = momentsViewHelper!.phAsset(from: indexPath, in: allMomentsFetchResult!)else {
                return cell
        }
        
        cell.representedAssetIdentifier = phAsset.localIdentifier
        
        PHImageManager().requestImage(for: phAsset, targetSize: self.collectionView.thumbnailSize(), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            
            
            // The cell may have been recycled by the time this handler gets called;
            // set the cell's thumbnail image only if it's still showing the same asset.
            if cell.representedAssetIdentifier == phAsset.localIdentifier {
                cell.thumbnailImage = image
            }
        })
        */
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // load collection header view that reads time, date for each collection
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "ViewHeader",
                                                                             for: indexPath)
            let label = headerView.viewWithTag(10) as! UILabel
            
            /*
            var text: String {
                if let list = allMomentsCollectionFetchResult?.object(at: indexPath.section),
                    let startDate = list.startDate,
                    let endDate = list.endDate {
                    
                    let f = DateFormatter()
                    f.dateStyle = .medium
                    f.timeStyle = .medium
                    
                    return "\(f.string(from: startDate)) - \(f.string(from:endDate))"
                } else {
                    return ""
                }
            }
            
            label.text = text
            */
            
            
            return headerView
            
        default:
            
            fatalError("Unexpected element kind")
        }
    }
    
}
