//
//  CameraViewController.swift
//  DashCam
//
//  Created by Mark Park on 11/22/21.
//

import Foundation
import UIKit
import MobileCoreServices
import AVKit

class CameraViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func playVideoPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
    
    @IBAction func recordDrivePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "RecordVideo", sender: self)
    }
    
}
