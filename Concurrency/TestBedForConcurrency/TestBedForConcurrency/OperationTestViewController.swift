//
//  OperationTestViewController.swift
//  TestBedForConcurrency
//
//  Created by GIWON1 on 2018. 3. 9..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class OperationTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let operation1 = AlertOperation()
        let operation2 = AlertOperation()
        let operation3 = AlertOperation()
        
        operation1.num = 10
        operation2.num = 20
        operation3.num = 30
        
        
        
        
        //        operation3.addDependency(operation2)
        //        operation2.addDependency(operation1)
        
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        
        
        operation1.cancelAllOperations = {
            operationQueue.cancelAllOperations()
        }
        
        
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        operationQueue.addOperation(operation3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
