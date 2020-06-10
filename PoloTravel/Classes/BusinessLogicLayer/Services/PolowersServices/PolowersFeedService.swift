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
    var photoListSorted:Photo = []
    
    func updateFeed(completionBlock: @escaping (_ success: Bool) -> Void) {
        self.photoList = []
        self.photoListSorted = []
        let docRef = db.collection("pl_resources").document("r_polowers_photos")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                document.data()?.forEach{ photo in
                    let photoProps = photo.value as? NSDictionary
                    let imageUrl = photoProps?["imageUrl"] as? String
                    let userId = photoProps?["userId"] as? String
                    let userName = photoProps?["userName"] as? String
                    let nbLikes = photoProps?["nbLikes"] as? Int
                    let description = photoProps?["description"] as? String
                    let publicationDate = photoProps?["publicationDate"] as! Timestamp
                    let imageId = photoProps?["imageId"] as? String
                    let userPhotoURL = photoProps?["userPhotoURL"] as? String
                    
                    if (self.photoList.contains(PhotoElement(imageURL: imageUrl!, userId: userId!, userName: userName!, description: description!, imageId: imageId!, userPhotoURL: userPhotoURL!, likes: nbLikes!, publicationDate: publicationDate.dateValue()))) == false {
                        self.photoList.append(PhotoElement(imageURL: imageUrl ?? "", userId: userId ?? "", userName: userName ?? "", description: description ?? "", imageId: imageId ?? "", userPhotoURL: userPhotoURL ?? "", likes: nbLikes ?? 0, publicationDate: publicationDate.dateValue()))
                    }
                }
                self.photoListSorted = self.photoList.sorted{ $0.publicationDate > $1.publicationDate  }
                
                completionBlock(true)
            } else {
                completionBlock(false)
                print("Document does not exist")
            }
        }
    }
}
