//
//  MyTableViewController.swift
//  TestOnSimpleAnimation
//
//  Created by GIWON1 on 2018. 3. 23..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var cell1: Cell1!
    @IBOutlet weak var cell2: Cell2!
    @IBOutlet weak var cell3: Cell3!
    @IBOutlet weak var headerView: UIView!
    
    @IBAction func buttonAction1(_ sender: UIBarButtonItem) {
    
        cell1.animation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.tableFooterView = {
           let footerView = UIView()
            footerView.frame = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 50)
            footerView.backgroundColor = UIColor.groupTableViewBackground
            return footerView
        }()
 
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return cell1
        case 1:
            return cell2
        case 2:
            return cell3
        default:
            break
        
        }

        fatalError()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return self.view.bounds.height - 40
        } else if indexPath.row == 1 {
            return 30
        } else if indexPath.row == 2 {
            return 40
        } else {
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }

}
