//
//  PolowersPhotoService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 01/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PolowersFeedService {
    let db = Firestore.firestore()
    
    var photoList:Photo = []
    
    func updateFeed(completionBlock: @escaping (_ success: Bool) -> Void) {
        let docRef = db.collection("pl_resources").document("r_polowers_photos")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                document.data()?.forEach{ photo in
                    let photoProps = photo.value as? NSDictionary
                    let imageUrl = photoProps?["imageUrl"] as? String
                    let userId = photoProps?["userId"] as? String
                    let userName = photoProps?["userName"] as? String
                    let nbLikes = photoProps?["nbLikes"] as? Int
                    
                    if (self.photoList.contains(PhotoElement(imageURL: imageUrl!, userId: userId!, userName: userName!, likes: nbLikes!))) == false {
                        self.photoList.append(PhotoElement(imageURL: imageUrl ?? "", userId: userId ?? "", userName: userName ?? "", likes: nbLikes ?? 0))
                    }
                }
                
                completionBlock(true)
            } else {
                completionBlock(false)
                print("Document does not exist")
            }
        }
    }
}
