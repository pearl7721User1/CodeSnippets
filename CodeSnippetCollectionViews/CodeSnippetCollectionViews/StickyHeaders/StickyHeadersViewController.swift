//
//  ViewController.swift
//  StickyHeaders
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class StickyHeadersViewController: UIViewController {

    // MARK: - Properties

    fileprivate let CellIdentifier = "StickyHeaderCell"
    fileprivate let HeaderIdentifier = "Header"
    @IBOutlet weak var collectionViewTopOffsetConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func rightBtnTapped(_ sender: UIBarButtonItem) {
        
        if #available(iOS 11.0, *) {
            let top = collectionView.adjustedContentInset.top
            let bottom = collectionView.adjustedContentInset.bottom
            let left = collectionView.adjustedContentInset.left
            let right = collectionView.adjustedContentInset.right
            
            print("\(top), \(bottom), \(left), \(right)")
        } else {
            // Fallback on earlier versions
            let top = collectionView.contentInset.top
            let bottom = collectionView.contentInset.bottom
            let left = collectionView.contentInset.left
            let right = collectionView.contentInset.right
            
            print("\(top), \(bottom), \(left), \(right)")
            
        }
        
        print(collectionView.contentOffset.y)
    }
    
    // MARK: - View Methods

    private func setupCollectionView() {
        // Initialize Collection View Flow Layout
        let layout = StickyHeadersCollectionViewFlowLayout()
//        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 50.0)
        collectionView.collectionViewLayout = layout
        
        // Configure Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white

        // Register Classes for Cell Reuse
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CellIdentifier)
        
        // Add as Subview
        view.addSubview(collectionView)

        // Add Constraints
        
        print(UIDevice.current.model)
        
    }

}

extension StickyHeadersViewController: UICollectionViewDataSource {

    // MARK: - Collection View Data Source Methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Int(arc4random_uniform(10) + 2)
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue Reusable Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath)

        // Configure Cell
        cell.backgroundColor = UIColor.random()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Dequeue Reusable Supplementary View
        // load collection header view that reads time, date for each collection
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "Header",
                                                                             for: indexPath)
            if let label = headerView.viewWithTag(10) as? UILabel {
                label.text = "TEXT"
            }
            
            return headerView
            
        default:
            
            fatalError("Unexpected element kind")
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // switch on/off constraints
        
        super.traitCollectionDidChange(previousTraitCollection)
        
        if let layout = collectionView.collectionViewLayout as? StickyHeadersCollectionViewFlowLayout {
            
            switch UIDevice.current.orientation {
            case .portrait:
                layout.topOffset = 64
            default:
                layout.topOffset = 32
            }
            
        }
        
    }

}


extension StickyHeadersViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Collection View Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50.0)
    }
 
}

