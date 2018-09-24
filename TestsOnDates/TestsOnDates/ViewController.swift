//
//  ViewController.swift
//  TestsOnDates
//
//  Created by SeoGiwon on 23/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DateSetterDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dates: [Dates]? {
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        return appDelegate.coreDataStack?.dates()
    }
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func presentDateSetter(_ sender: UIBarButtonItem) {
        
        let navigationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DateSetterNavigationViewController") as! UINavigationController
        
        let dateSetterViewController = navigationVC.viewControllers.first as! DateSetterViewController
        dateSetterViewController.delegate = self
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func add(date: String) {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        if let coreDataStack = appDelegate.coreDataStack {
            coreDataStack.addDate(string: date)
        }
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dates != nil ? dates!.count : 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let dates = dates {
            cell.textLabel?.text = dates[indexPath.row].date
        }
        
        return cell
    }
}

