//
//  RecordVideoViewController.swift
//  DashCam
//
//  Created by Mark Park on 12/3/21.
//

import Foundation
import UIKit
import AVKit
import SwiftUI
import MobileCoreServices

class RecordVideoViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional Set-up
        recordButton.imageView?.contentMode = .scaleAspectFit
        self.hideKeyboardWhenTappedAround()
    }
    // Accesses .camera as image picker to open in built in camera mode 
    @IBAction func recordVideoPressed(_ sender: Any) {
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .camera)
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, options: [.mixWithOthers, .defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session.")
        }
    }
    
    // Saving video alert functionality
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject){
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved." : "Video failed to save."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

// Delegate methods gives URL pointing to the video, verifies that the app can save the file to the device's photo album, and finally saves it.
extension RecordVideoViewController : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)
        
        guard
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
                mediaType == (kUTTypeMovie as String),
                let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else {
                return 
            }
        UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, #selector(video(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

extension RecordVideoViewController: UINavigationControllerDelegate {
    
}
