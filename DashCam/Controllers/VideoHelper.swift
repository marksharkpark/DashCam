//
//  VideoHelper.swift
//  DashCam
//
//  Created by Mark Park on 11/24/21.
//

import MobileCoreServices
import UIKit

// This enum contains a helper method to check if the source(camera roll, camera, and photo library) is available on the device.
// This is essential when using UIImagePickerController to pick media. If available, it creates the proper source and media type. Afterwards, it will present the UIImagePickerController modally.

enum VideoHelper {
  static func startMediaBrowser(
    delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate,
    sourceType: UIImagePickerController.SourceType
  )
    {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType)
          else { return }

        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = sourceType
        mediaUI.mediaTypes = [kUTTypeMovie as String]
        mediaUI.allowsEditing = true
        mediaUI.delegate = delegate
        delegate.present(mediaUI, animated: true, completion: nil)
    }
}
