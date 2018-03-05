//
//  ViewController.swift
//  TestOnCollectionViewItemCaching
//
//  Created by SeoGiwon on 18/01/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ItemAnimationTestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    @IBOutlet weak var collectionView: ItemAnimationCollectionView!
    
    var dataSource = [7, 4, 18, 3, 13, 5, 12]
    
    enum DataSourceType {
        case type1, type2
    }
    
    var dataSourceType = DataSourceType.type1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // move button tapped
    @IBAction func btnMoved(_ sender: UIBarButtonItem) {
        
        collectionView.performBatchUpdates({
            
            collectionView.moveItem(at: IndexPath(item: 0, section: 0), to: IndexPath(item: 3, section: 0))
//            collectionView.moveItem(at: IndexPath(item: 1, section: 5), to: IndexPath(item: 2, section: 3))
//            collectionView.moveItem(at: IndexPath(item: 2, section: 0), to: IndexPath(item: 1, section: 0))
            
        }, completion: nil)
        
    }
    
    // delete button tapped
    @IBAction func btnChangeDataSource(_ sender: UIBarButtonItem) {
        
        if dataSourceType == .type1 {
            dataSourceType = .type2
            dataSource = [5, 8, 10, 13, 3, 7]
            
            collectionView.performBatchUpdates({
                
                collectionView.deleteSections(IndexSet(integer:6))
                collectionView.reloadSections(IndexSet(IndexSet(integersIn: 0...5)))
                
            }, completion: nil)
        }
        else {
            dataSourceType = .type1
            dataSource = [2, 3, 7, 8, 5, 3, 9]
            
            collectionView.performBatchUpdates({
                
                collectionView.insertSections(IndexSet(integer:6))
                collectionView.reloadSections(IndexSet(IndexSet(integersIn: 0...5)))
                
                
            }, completion: nil)
        }
        
        
    }
    
    // add button tapped
    @IBAction func barBounds(_ sender: UIBarButtonItem) {
        
        // tries to see indexpaths of this collection view that belongs to the given rect
        
        let bounds = collectionView.bounds.insetBy(dx: 0, dy: -0.5 * collectionView.bounds.height)
        /*
        let indexPaths = [bounds, bounds.insetBy(dx: 0, dy:  -0.5 * collectionView.bounds.height)].flatMap {
            rect in collectionView.indexPaths(from: rect)
            }
        */
        
        let indexPaths = collectionView.indexPaths(from: bounds)
        
        for (i, indexPath) in indexPaths.enumerated() {
            print("section: \(indexPath.section) item: \(indexPath.item)")
        }
    }
    
    private func cellColor(indexPath: IndexPath) -> UIColor {
        
        
        let step = 1.0 / CGFloat(dataSource.reduce(0, { $0 + $1 }))

        var existingSum = 0
        
        if indexPath.section > 0 {
            let subArray = dataSource[0...indexPath.section-1]
            existingSum = subArray.reduce(0, { $0 + $1 })
        }
       
        let redValue = CGFloat(existingSum) * step + CGFloat(indexPath.item) * step
        
      
        return UIColor(red: CGFloat(redValue), green: 0, blue: 0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemAnimationCell", for: indexPath)
        cell.backgroundColor = cellColor(indexPath: indexPath)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // load collection header view that reads time, date for each collection
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "CollectionViewHeader",
                                                                             for: indexPath)
            let label = headerView.viewWithTag(10) as! UILabel
            label.text = "headerView"
            return headerView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
}

