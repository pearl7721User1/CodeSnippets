//
//  TestCollectionView.swift
//  TestOnCollectionViewItemCaching
//
//  Created by SeoGiwon on 18/01/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ItemAnimationCollectionView: UICollectionView {

    enum CollectionViewType: String {
        case MomentsCluster, Moments
    }
    
    var collectionViewType = CollectionViewType.MomentsCluster
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let flowLayout = ItemAnimationCollectionView.flowLayout(of: collectionViewType)
        self.collectionViewLayout = flowLayout
    }
    
    func indexPaths(from rect:CGRect) -> [IndexPath] {
        
        let allLayoutAttributes = collectionViewLayout.layoutAttributesForElements(in: rect)!
        return allLayoutAttributes.map { $0.indexPath }
        
        
    }
    
    func randomInts(from rect:CGRect) -> [Int] {
        
        return [3, 5, 10 ,3, 6]
        
    }
    
    static private func cellSize(of collectionViewType:CollectionViewType) -> CGSize {
        
        let screenSize = UIScreen.main.bounds.size
        let spacing = ItemAnimationCollectionView.spacing()
        
        var cellWidth: CGFloat = 0.0
        switch collectionViewType {
        case .Moments:
            cellWidth = (screenSize.width - (spacing*3)) / 4
        case .MomentsCluster:
            cellWidth = (screenSize.width - (spacing*3)) / 4
        }
        
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    static private func thumbnailSize(of collectionViewType:CollectionViewType) -> CGSize {
        
        let scale = UIScreen.main.scale
        let cellSize = self.cellSize(of: collectionViewType)
        let thumbnailSize = CGSize(width: cellSize.width * scale, height: cellSize.height * scale)
        return thumbnailSize
    }
    
    static func flowLayout(of collectionViewType:CollectionViewType) -> UICollectionViewFlowLayout {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = ItemAnimationCollectionView.cellSize(of: collectionViewType)
        flowLayout.minimumLineSpacing = self.spacing()
        flowLayout.minimumInteritemSpacing = ItemAnimationCollectionView.spacing()
        flowLayout.headerReferenceSize = CGSize(width: 50, height: 50)
        return flowLayout
    }
    
    static func spacing() -> CGFloat {
        return 1.5
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
