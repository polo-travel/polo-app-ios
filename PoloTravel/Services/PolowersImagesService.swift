//
//  AuthentificationService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 20/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import UIKit

class PolowersImagesService {
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    lazy var storageRef = storage.reference()
    let userManager = AuthentificationService()
    var user: User?
    

    func addImageToDatabase(inputDescription:UITextView, imgToUpload: UIImage, completionBlock: @escaping (_ success: Bool) -> Void) {
        if inputDescription.text != "" {
            
            userManager.currentUser() { result  in
                self.user = result
            }

        uploadMedia(imgToUpload: imgToUpload) { url in
             guard let url = url else {
                completionBlock(false)
                
                return
            }

            self.db.collection("pl_resources").document("r_polowers_photos").setData([
                UUID().uuidString: [
                    "description": inputDescription.text ?? "",
                    "imageUrl": url,
                    "nbLikes": 0,
                    "publicationDate": Date(),
                    "userId": self.user?.uid as Any,
                    "userName": self.user?.firstName as Any,
                ],
            ], merge: true)
            completionBlock(true)
        }
        }
    }
    
    func uploadMedia(imgToUpload: UIImage, completion: @escaping (_ url: String?) -> Void) {
       storageRef = storageRef.child("polowers_photos/"+UUID().uuidString)
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

