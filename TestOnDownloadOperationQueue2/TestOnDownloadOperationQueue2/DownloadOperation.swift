//
//  DownloadOperation.swift
//  TestOnDownloadOperationQueue2
//
//  Created by GIWON1 on 2018. 3. 21..
//  Copyright © 2018년 GIWON1. All rights reserved.
//

import UIKit

class DownloadOperation: Operation {
    
    // MARK: CunCurrency
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    override func start() {
        
        _executing = true
    }
    
    
    
    
}

extension DownloadOperation: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print("\(downloadTask.taskIdentifier): operation counts in the queue: \(operationQueue.operationCount)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print("\(downloadTask.taskIdentifier) download completed")
    }
    
}
