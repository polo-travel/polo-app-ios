//
//  MediaUploadUtils.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 10/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

class MediaUploadUtils {
    let storage = Storage.storage()
    lazy var storageRef = storage.reference()
    
    func uploadMedia(imgToUpload: UIImage, imgFolder: String, completion: @escaping (_ url: String?) -> Void) {
       storageRef = storageRef.child("\(imgFolder)/"+UUID().uuidString)
        if let uploadData = imgToUpload.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {
                    self.storageRef.downloadURL(completion: { (url, error) in
                        completion(url?.absoluteString)
                    })
                }
            }
        }

    }
}

