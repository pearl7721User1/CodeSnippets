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
    private var imageCache = NSCache<NSString, UIImage>()
    
    private func createDataSource() {
        
        // fetch all moments cluster PHCollection Lists, resulting in feeding allPHCollectionLists
        let startDateFetchOption: PHFetchOptions = {
            
            let options = PHFetchOptions()
            options.sortDescriptors = [NSSortDescriptor(key:"startDate", ascending: true)]
            return options
        }()        
        
        allPHCollectionLists = PHCollectionList.fetchMomentLists(with: .momentListCluster, options: startDateFetchOption)
        
        
        // if allMomentsFetchResult exist, iterate over all the elements of allPHCollectionLists,
        // take each PHCollectionList and allMomentsFetchResult as parameters to produce a MomentsClusterDataSourceElement instance, resulting in producing an array of
        // MomentsClusterDataSourceElement to use it as the section, row of this collection view
        self.dataSource = [MomentsClusterDataSourceElement]()
        if let allMomentsPHAssets = allMomentsProvider?.allMomentsFetchResult {
            
            allPHCollectionLists?.enumerateObjects({ (list, index, stop) in
                
                if let element = MomentsClusterDataSourceElement(phCollectionList: list, allPHAssets: allMomentsPHAssets) {
                    self.dataSource!.append(element)
                }
                
            })
        }
    }
    
    // collection view for displaying the asset thumbnails
    @IBOutlet weak var collectionView: MomentsCommonCollectionView!
    
    var allMomentsProvider: AllMomentsProvider? {
        return (self.navigationController as! MomentsClusterNavigationController).allMomentsProvider
    }
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewType = .MomentsCluster
        collectionView.prefetchDataSource = self

        // fetch all moments
        (self.navigationController as! MomentsClusterNavigationController).initAllMomentsProvider()
        self.createDataSource()
        
    }
    
    
    
    // MARK: - CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GridViewCell.self), for: indexPath) as? GridViewCell else { fatalError("failed to dequeue GridViewCell") }
        
        if let dataSource = dataSource {
            let phAsset = dataSource[indexPath.section].phAssets[indexPath.row]
            
            if let image = imageCache.object(forKey: phAsset.localIdentifier as NSString) {
                cell.thumbnailImage = image
//                print("cached")
            } else {
                
//                print("NOT")
                cell.representedAssetIdentifier = phAsset.localIdentifier
                PHImageManager().requestImage(for: phAsset, targetSize: self.collectionView.thumbnailSize(), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
                    
                    // The cell may have been recycled by the time this handler gets called;
                    // set the cell's thumbnail image only if it's still showing the same asset.
                    if cell.representedAssetIdentifier == phAsset.localIdentifier {
                        cell.thumbnailImage = image
                    }
                })
            }
        }
        
        
        /*
        
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
        
        if let dataSource = dataSource {
            return dataSource[section].phAssets.count ?? 0
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let dataSource = dataSource {
            return dataSource.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // load collection header view that reads time, date for each collection
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "ViewHeader",
                                                                             for: indexPath)
            let label = headerView.viewWithTag(10) as! UILabel
            
            if let dataSource = dataSource,
                let startDate = dataSource[indexPath.section].phCollectionList.startDate,
            let endDate = dataSource[indexPath.section].phCollectionList.endDate {
                
                let f = DateFormatter()
                f.dateStyle = .medium
                f.timeStyle = .medium
                
                label.text = "\(f.string(from: startDate)) - \(f.string(from:endDate))"
                
            }
            
            return headerView
            
        default:
            
            fatalError("Unexpected element kind")
        }
    }
    
}


extension MomentsClusterViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        if let dataSource = dataSource {
            
            print("prefetch")
            
            for indexPath in indexPaths {
                let phAsset = dataSource[indexPath.section].phAssets[indexPath.row]
                
//                print("indexPath:\(indexPath.section), \(indexPath.row)")
                
                if let image = imageCache.object(forKey: phAsset.localIdentifier as NSString) {
                    // do nothing
                } else {
                    // create cache
                    
                    print("indexPath:\(indexPath.section), \(indexPath.row)")
                    
                    
                    let requestOptions = PHImageRequestOptions()
                    requestOptions.deliveryMode = .opportunistic
                    requestOptions.resizeMode = .fast
                    
                    PHImageManager().requestImage(for: phAsset, targetSize: self.collectionView.thumbnailSize(), contentMode: .aspectFill, options: requestOptions, resultHandler: { image, _ in
                        
                        if let image = image {
                            self.imageCache.setObject(image, forKey: phAsset.localIdentifier as NSString)
                        }
                    })
                }
                
            }
        }
        
    }
    
}
