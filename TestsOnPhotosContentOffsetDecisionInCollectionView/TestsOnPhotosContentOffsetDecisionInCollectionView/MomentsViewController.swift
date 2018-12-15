//
//  MomentsViewController.swift
//  PhotokitMomentsTesting
//
//  Created by SeoGiwon on 12/28/16.
//  Copyright © 2016 SeoGiwon. All rights reserved.
//

import UIKit
import Photos

protocol MomentsScrollToPosition {
    
    func scroll(for phAsset: PHAsset)
}

class MomentsViewController: UIViewController, UICollectionViewDataSource, MomentsScrollToPosition {

    // to set the collection view's focus to the last item for the first time only
    var viewDidLayoutSubviewsForTheFirstTime = true
    
    var allMomentsFetchResult: PHFetchResult<PHAsset>?
    var allMomentsCollectionFetchResult: PHFetchResult<PHAssetCollection>?
    
    var momentsViewHelper: MomentsViewHelper?
    
    
    
    
    // collection view for displaying the asset thumbnails
    @IBOutlet weak var collectionView: MomentsCommonCollectionView!
    
    // MARK: - View Cycle
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewType = .Moments
        
        // your code here
        PHPhotoLibrary.requestAuthorization { [unowned self] (status) in
            
            DispatchQueue.main.async {
                switch (status) {
                case .authorized:
                    
                    self.allMomentsFetchResult = self.fetchAllMoments()
                    self.allMomentsCollectionFetchResult = self.fetchAllMomentsCollection()
                    
                    if self.allMomentsCollectionFetchResult != nil {
                        self.momentsViewHelper = MomentsViewHelper(collectionFetchResult: self.allMomentsCollectionFetchResult!)
                    }
                    
                    
                    if self.theViewForUnavailablePermission.superview != nil {
                        self.theViewForUnavailablePermission.removeFromSuperview()
                    }
                    self.collectionView.reloadData()
                    
                default:
                    
                    if self.theViewForUnavailablePermission.superview == nil {
                        self.view.insertSubview(self.theViewForUnavailablePermission, aboveSubview: self.collectionView)
                    }
                }
            }
            
        }
        
        if (PHPhotoLibrary.authorizationStatus() == .authorized) {
            // ask for init fetch
            self.allMomentsFetchResult = self.fetchAllMoments()
            self.allMomentsCollectionFetchResult = self.fetchAllMomentsCollection()
            
            if allMomentsCollectionFetchResult != nil {
                self.momentsViewHelper = MomentsViewHelper(collectionFetchResult: self.allMomentsCollectionFetchResult!)
            }
            
            self.collectionView.reloadData()
            
            if self.theViewForUnavailablePermission.superview != nil {
                self.theViewForUnavailablePermission.removeFromSuperview()
            }
            
        } else {
            if self.theViewForUnavailablePermission.superview == nil {
                self.view.insertSubview(self.theViewForUnavailablePermission, aboveSubview: self.collectionView)
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // manually set the view's layout so that it doesn't need to set its constraints for the sake of simplicity
        theViewForUnavailablePermission.frame = self.view.frame
    }
    
    override func viewDidLayoutSubviews() {
        
        // to set the collection view's focus to the last item. This should occur only once when the view is loaded for the first time
        if (viewDidLayoutSubviewsForTheFirstTime) {
            viewDidLayoutSubviewsForTheFirstTime = false
            
            let lastSection = collectionView.numberOfSections - 1
            let lastItem = collectionView.numberOfItems(inSection: lastSection) - 1
            let indexPath = IndexPath(item: lastItem, section: lastSection)
            
            collectionView.scrollToItem(at: indexPath, at: [.left, .bottom], animated: false)
            
        }
        
    }
    
    @IBAction func popupForPhotosSelection(_ sender: UIBarButtonItem) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        vc.allMomentsFetchResult = allMomentsFetchResult
        vc.photosPositioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GridViewCell.self), for: indexPath) as? GridViewCell else { fatalError("failed to dequeue GridViewCell") }
        
        
        /*
        // given section, get filter parameters, i.e. creation fromDate, creation toDate
        guard let collection = allMomentsCollectionFetchResult?.object(at: indexPath.section),
            let startDate = collection.startDate,
            let endDate = collection.endDate,
            let allMomentsFetchResult = allMomentsFetchResult else {
            return cell
        }
        
        let phAssetArrayForSection = PHAsset.assetsOfCreationDateStarting(from: startDate, to: endDate, in: allMomentsFetchResult)
        
        let phAsset = phAssetArrayForSection[indexPath.row]
        */
        
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
        
            
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let fetchResult = allMomentsCollectionFetchResult {
            return fetchResult.object(at: section).estimatedAssetCount
        } else {
            return 0
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if let fetchResult = allMomentsCollectionFetchResult {
            return fetchResult.count
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
            
            
            
            return headerView
            
        default:
            
            fatalError("Unexpected element kind")
        }
    }
    
    
    func scroll(for phAsset: PHAsset) {
        
        guard allMomentsFetchResult != nil,
            momentsViewHelper != nil,
            let indexPath = momentsViewHelper!.indexPath(from: phAsset, in: allMomentsFetchResult!) else {
            
            return
        }
        
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        
    }
    
}

