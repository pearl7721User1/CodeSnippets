/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This file shows how to present an alert as part of an operation.
 */

import UIKit

class AlertOperation: Operation {
    // MARK: Properties
    
    private let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    private let presentationContext: UIViewController? = nil
    var num = 0
    var cancelAllOperations: (() -> ())?
    
    
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
    
    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    
    
    var title: String? {
        get {
            return alertController.title
        }
        
        set {
            alertController.title = newValue
            name = newValue
        }
    }
    
    var message: String? {
        get {
            return alertController.message
        }
        
        set {
            alertController.message = newValue
        }
    }
    
    
    func addAction(title: String, style: UIAlertActionStyle = .default, handler: @escaping (AlertOperation) -> Void = { _ in }) {
        let action = UIAlertAction(title: title, style: style) { [weak self] _ in
            if let strongSelf = self {
                handler(strongSelf)
                
                if let cancelAllOperations = strongSelf.cancelAllOperations {
                    cancelAllOperations()
                }
                
            }
            
            self?.executing(false)
            self?.finish(true)
            
            print("\(self?.num) finished")
        }
        
        alertController.addAction(action)
    }
    
    override func start() {
        
        print("\(self.num) started")
        executing(true)
        
        DispatchQueue.main.async {
            if self.alertController.actions.isEmpty {
                
                self.addAction(title: "OK\(self.num)")
            }
            
            if let appDelegate = UIApplication.shared.delegate,
                let appWindow = appDelegate.window!,
                let rootViewController = appWindow.rootViewController {
                rootViewController.present(self.alertController, animated: true, completion: nil)
            }
            
        }
        
    }
}
