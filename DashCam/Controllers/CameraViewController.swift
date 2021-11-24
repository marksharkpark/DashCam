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
    }
    
    extension PlayVideoViewController: UIImagePickerControllerDelegate{
        
    }
    
    extension PlayVideoViewController: UINavigationControllerDelegate {
        
    }
    
    
    extension CameraViewController: UIImagePickerControllerDelegate{
        
    }
    
    extension CameraViewController: UINavigationControllerDelegate{
        
    }
}
