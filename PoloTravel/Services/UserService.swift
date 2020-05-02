//
//  UserProfileService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore   

class UserService {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    func currentUser(completionHandler: @escaping (_ result: User?) -> Void) {
        var firstName: String?
        var lastName: String?
        
        if let user = user {
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          
          let docRef = db.collection("pl_users").document(user.uid)
          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                firstName = document.get("firstname") as? String
                lastName = document.get("lastname") as? String
                completionHandler(User(firstName: firstName, lastName: lastName, uid: uid, email: email, photoURL: photoURL))
              } else {
                  print("User does'nt exist")
                  completionHandler(nil)
              }
          }
        }

    }
    
    func updateProfile(firstname: String, lastname: String, email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        if let user = user {
            let docRef = db.collection("pl_users").document(user.uid)
            
            if (password != "") {
               user.updatePassword(to: password) { (error) in
                    if error != nil {
                        completionBlock(false)
                    }
               }
            }
            
            if (email != "") {
               user.updateEmail(to: email) { (error) in
                    if error != nil {
                        print("email edited")
                        completionBlock(false)
                    } else {
                        docRef.setData([ "email": email ], merge: true)
                    }
               }
            }
            
            if (firstname != "") {
               docRef.setData([ "firstname": firstname ], merge: true)
            }
            
            if (lastname != "") {
               docRef.setData([ "lastname": lastname ], merge: true)
            }
            
            print("completed")
            completionBlock(true)
        } else {
            completionBlock(false)
        }
    }
}

