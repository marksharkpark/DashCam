//
//  PlayVideoViewController.swift
//  DashCam
//
//  Created by Mark Park on 11/24/21.
//

import UIKit
import AVKit
import MobileCoreServices

class PlayVideoViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional Setup
//        loadVideoPlayer()
    }
    
    @IBAction func loadPhotoAlbum(_ sender: Any) {
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
    
    // Below is a call to helper method "startMediaBrowser(delegate:) from videoHelper.
    // The call will open the image picker, setting the delegate to self.
    // The sourceType of .savedPhotosAlbum opts to choose an image from the camera roll.
    func loadVideoPlayer(){
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
}

extension PlayVideoViewController: UIImagePickerControllerDelegate{
  
}

extension PlayVideoViewController: UINavigationControllerDelegate {
  
}
