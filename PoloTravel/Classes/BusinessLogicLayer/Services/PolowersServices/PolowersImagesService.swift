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
    let userManager = UserService()
    var user: User?
    

    func addImageToDatabase(inputDescription:UITextView, imgToUpload: UIImage, completionBlock: @escaping (_ success: Bool) -> Void) {
        if inputDescription.text != "" {
            
            userManager.currentUser() { result  in
                self.user = result
                
                MediaUploadUtils().uploadMedia(imgToUpload: imgToUpload, imgFolder: "polowers_photos") { url in
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
                            "lastName": self.user?.lastName as Any,
                        ],
                    ], merge: true)
                    completionBlock(true)
                }
            }
        }
    }
    
    
}

