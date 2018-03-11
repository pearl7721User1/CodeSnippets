//
//  ViewController.swift
//  TestOnURLSessionOperationQueue
//
//  Created by SeoGiwon on 11/03/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

/*
    README
 
    I wanted to see what an operation queue that a URLSession takes as a parameter can do.
    My initial thoughts on this is that the operation queue parameter is designed around for each
    download task to be completed sequantially. But, it turns out, it's not.
 
    Once a download task is fired, there's absolutely no guarantee that they arrive in order.
 
*/


class ViewController: UIViewController, URLSessionDownloadDelegate {

    let imgURLs = ["https://cdn.pixabay.com/photo/2018/02/26/16/44/bird-3183441_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2018/02/26/16/30/eggs-3183410_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2018/02/24/20/39/clock-3179167_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2018/02/27/07/36/nature-3184889_960_720.jpg",
                   
                   "https://cdn.pixabay.com/photo/2018/02/26/21/04/owl-3184032_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2018/01/04/18/58/cats-3061372_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2016/12/13/11/24/hoarfrost-1903886_960_720.jpg",
                   "https://cdn.pixabay.com/photo/2018/01/31/09/57/coffee-3120750_960_720.jpg"
                   ]
    
    lazy var operationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 10
        return queue
    }()
    
    lazy var session: URLSession = {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
        return session
    }()
    
    @IBAction func fireDownloadRequests(_ sender: UIButton) {
        // create download tasks
        for imgURL in imgURLs {
            
            let downloadTask = session.downloadTask(with: URL(string: imgURL)!)
            downloadTask.resume()
        }
    }
    

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print("\(downloadTask.taskIdentifier): operation counts in the queue: \(operationQueue.operationCount)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print("\(downloadTask.taskIdentifier) download completed")
    }
    
    
}



