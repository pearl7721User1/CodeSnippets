//
//  ViewController.swift
//  TestsOnOperations
//
//  Created by SeoGiwon on 21/02/2019.
//  Copyright © 2019 SeoGiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print(downloadTask.taskIdentifier)
    }
    

    lazy var queue: OperationQueue = {
       
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    lazy var downloadSession: URLSession = {
        
        return URLSession.init(configuration: .default, delegate: self, delegateQueue: queue)
    }()
    
    let url1 = URL(string: "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")!
    let url2 = URL(string: "https://images.pexels.com/photos/209037/pexels-photo-209037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")!
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        
        let serialQueue = DispatchQueue(label: "queuename")
        serialQueue.sync {
            downloadTask1().resume()
        }
        serialQueue.sync {
            downloadTask2().resume()
        }
    }
    
    func downloadTask1() -> URLSessionDownloadTask {
        let downloadTask1 = downloadSession.downloadTask(with: url1)
        return downloadTask1
    }
    
    func downloadTask2() -> URLSessionDownloadTask {
        let downloadTask2 = downloadSession.downloadTask(with: url2)
        return downloadTask2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

}

