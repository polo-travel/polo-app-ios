//
//  PolowersCommentsService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 09/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PolowersCommentService {
    let db = Firestore.firestore()
    let userManager = UserService()
    
    // Get all the commnts for a specific Polowers photo
    func getComments(imageId: String, completionHandler: @escaping (_ travelPack: NSArray?) -> Void) {
        let docRef = db.collection("pl_resources").document("r_polowers_photos")
        
        docRef.getDocument { (document, error) in
          if let document = document, document.exists {
              let photo = document.data()?[imageId] as! NSDictionary
            
            if let comments = photo["comments"] {
                let commentsConverted = comments as! NSArray
                completionHandler(commentsConverted)
            } else {
                completionHandler(nil)
            }
          }
        }
    }
    
    
    func addComment(imageId: String, text: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        let docRef = db.collection("pl_resources").document("r_polowers_photos")
        
        // Check that an user is connected
        userManager.currentUser() { result  in
            if let user = result {

                var comments:[NSDictionary] = []
                
                // Get all te comments
                self.getComments(imageId: imageId) { commentss in
                    if let currentComments = commentss {
                        let currentCommentsConverted = currentComments
                        currentCommentsConverted.forEach { comment in
                            comments.append(comment as! NSDictionary)
                        }
                        comments.append(["date": Date(), "text": text, "userFirstName": user.firstName, "userPhoto": user.photoURL ?? ""])
                    } else {
                        comments = [
                            ["date": Date(), "text": text, "userFirstName": user.firstName, "userPhoto": user.photoURL ?? ""]
                        ]
                    }
                    
                    // Update comments with the new commment
                    docRef.setData([ imageId: [
                        "comments": comments
                    ] ], merge: true)
                    completionBlock(true)
                }
            } else {
                completionBlock(false)
            }
        }
    }
}

