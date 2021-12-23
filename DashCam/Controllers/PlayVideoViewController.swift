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
        loadVideoPlayer()
        self.hideKeyboardWhenTappedAround()
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
    
    // Retrieving media type of selected media and URL while ensuring it is an actual video.
    // Then we dismiss the image picker and create an AVPlayerViewController to play the media.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String, mediaType == (kUTTypeMovie as String), let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
            else{
                return
            }
        dismiss(animated: true){
            let player = AVPlayer(url: url)
            let vcPlayer = AVPlayerViewController()
            vcPlayer.player = player
            self.present(vcPlayer, animated: true, completion: nil)
        }
    }
}

extension PlayVideoViewController: UINavigationControllerDelegate {
  
}
