//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by SeoGiwon on 1/10/17.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SimpleCell"

class FlowLayoutChangeTestViewController: UICollectionViewController {

    enum LayoutType {
        case first, second
    }
    
    var layoutType = LayoutType.first
    
    var layout1 = Layout1()
    var layout2 = Layout2()
    
    var numberOfRows1 = [1, 1, 1, 1, 1, 4, 8, 1, 3, 2, 3, 1, 3, 4, 1, 1, 1, 11, 3, 1]
    var numberOfRows2 = [1, 1, 1, 1, 1, 4, 8, 9, 9, 1, 10, 6, 5, 10, 10, 20, 20, 1, 3, 1]
    var colorValues = [Any]()//[Float]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calculateColorValue()
        
        collectionView?.collectionViewLayout = layout1
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        
    }
    
    @IBAction func switchLayout(_ sender: UIBarButtonItem) {
        
        if layoutType == .first {
            layoutType = .second
            calculateColorValue()
            collectionView?.setCollectionViewLayout(layout2, animated: true)
            
        } else {
            layoutType = .first
            calculateColorValue()
            collectionView?.setCollectionViewLayout(layout1, animated: true)
            
        }
        
        
    }
    
    func calculateColorValue() {
        
        colorValues.removeAll()
        
        var cellTotal = (layoutType == .first ? numberOfRows1 : numberOfRows2).reduce(0, {(x: Int, y: Int) -> Int in
            return x+y
        })
        
        var iterator = 0
        for i in 0 ..< (layoutType == .first ? numberOfRows1 : numberOfRows2).count {
            
            var element = [Float]()
            for j in 0 ..< (layoutType == .first ? numberOfRows1 : numberOfRows2)[i] {
                
                let value = 1.0 - (Float(iterator)+1.0) / Float((cellTotal))
                iterator += 1
                
                element.append(value)
                
            }
            
            colorValues.append(element)
        }
        
        
        
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if layoutType == .first {
            return numberOfRows1.count
        } else {
            return numberOfRows2.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if layoutType == .first {
            return numberOfRows1[section]
        } else {
            return numberOfRows2[section]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "SimpleCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        var valueArray = colorValues[indexPath.section] as! [Float]
        let value = valueArray[indexPath.row]
        
        
        cell.backgroundColor = UIColor(red: CGFloat(value), green: 0.0, blue: 0.0, alpha: 1.0)
        
        
        return cell;
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath)
            
            reusableView.backgroundColor = UIColor.green
            return reusableView
        }
        else {
            fatalError()
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        newViewController.useLayoutToLayoutNavigationTransitions = true
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        */
        
        performSegue(withIdentifier: "DetailSegue", sender: self)
    }
}

