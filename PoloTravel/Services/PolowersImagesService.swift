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
    
    func addImageToDatabase(inputDescription:UITextView, imgToUpload: UIImage, completionBlock: @escaping (_ success: Bool) -> Void) {
        if inputDescription.text != "" {
            print("im in addImagesToDatabase")

        uploadMedia(imgToUpload: imgToUpload) { url in
             guard let url = url else {
                print("imgonnareturn")
                completionBlock(false)
                
                return
            }
            print("im in upload media")
            self.db.collection("pl_resources").document("r_polowers_photo").setData([
                "5200004": [
                    "posterName": "Jack",
                    "posterId": "Erogiregeri",
                    "description": "loloooo",
                    "imageUrl": url,
                ],
            ])
            completionBlock(true)
             
        }
        }
    }
    
    func uploadMedia(imgToUpload: UIImage, completion: @escaping (_ url: String?) -> Void) {
       storageRef = storageRef.child("polowers_images/myImage2.png")
        if let uploadData = imgToUpload.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {

                    self.storageRef.downloadURL(completion: { (url, error) in
                        print(url?.absoluteString)
                        completion(url?.absoluteString)
                    })

                  //  completion((metadata?.downloadURL()?.absoluteString)!))
                    // your uploaded photo url.


                }
            }
        }

    }
    
    
}

