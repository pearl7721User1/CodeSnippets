//
//  ViewController.swift
//  TestsOnCoreMotion
//
//  Created by SeoGiwon on 14/10/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var rollSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var yawSlider: UISlider!
    
    @IBOutlet weak var xAcSlider: UISlider!
    @IBOutlet weak var yAcSlider: UISlider!
    @IBOutlet weak var zAcSlider: UISlider!
    
    @IBOutlet weak var xRoSlider: UISlider!
    @IBOutlet weak var yRoSlider: UISlider!
    @IBOutlet weak var zRoSlider: UISlider!

    @IBOutlet weak var xGrSlider: UISlider!
    @IBOutlet weak var yGrSlider: UISlider!
    @IBOutlet weak var zGrSlider: UISlider!
    
    let motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startQueuedUpdates()
        self.becomeFirstResponder()
    }

    func startQueuedUpdates() {
        
        
        if motion.isDeviceMotionAvailable {
            self.motion.deviceMotionUpdateInterval = 1.0 / 60.0 //1.0 / 60.0
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(to: .main, withHandler: { (data, error) in
                
                // Make sure the data is valid before accessing it.
                if let validData = data {
                    // Get the attitude relative to the magnetic north reference frame.
                    let roll = validData.attitude.roll
                    let pitch = validData.attitude.pitch
                    let yaw = validData.attitude.yaw
                    
                    let ax = validData.userAcceleration.x
                    let ay = validData.userAcceleration.y
                    let az = validData.userAcceleration.z
                    
                    let gx = validData.gravity.x
                    let gy = validData.gravity.y
                    let gz = validData.gravity.z
                    
                    let rx = validData.rotationRate.x
                    let ry = validData.rotationRate.y
                    let rz = validData.rotationRate.z
                    
                    // Use the motion data in your app.
                    self.xAcSlider.value = Float(ax)
                    self.yAcSlider.value = Float(ay)
                    self.zAcSlider.value = Float(az)
                    self.xRoSlider.value = Float(rx)
                    self.yRoSlider.value = Float(ry)
                    self.zRoSlider.value = Float(rz)
                    self.xGrSlider.value = Float(gx)
                    self.yGrSlider.value = Float(gy)
                    self.zGrSlider.value = Float(gz)
                    
                    self.rollSlider.value = Float(roll)
                    self.pitchSlider.value = Float(pitch)
                    self.yawSlider.value = Float(yaw)
                    
                    if az >= 1 {
                        
                        let a = UIAlertController(title: "dropped", message: "dropped", preferredStyle: .alert)
                        a.addAction(UIAlertAction(title: "ok", style: .`default`
                            , handler: nil))
                        self.present(a, animated: true, completion: nil)
                    }
                    
                    
                    if rz < -7.5 {

                        let a = UIAlertController(title: "shaked", message: "shaked", preferredStyle: .alert)
                        a.addAction(UIAlertAction(title: "ok", style: .`default`
                            , handler: nil))
                        self.present(a, animated: true, completion: nil)
                        
                    }
                }
            })
        }
    }
    
}

