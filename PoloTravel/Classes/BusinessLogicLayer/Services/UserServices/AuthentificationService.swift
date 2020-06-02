//
//  AuthentificationService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 20/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit


class AuthentificationService {
    
    let db = Firestore.firestore()
    
    func createUser(email: String, password: String, firstname: String, lastname: String, completionHandler: @escaping (_ error: AuthErrorCode?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let error = error, let errorCode = AuthErrorCode(rawValue: error._code) {
                completionHandler(errorCode)
            } else {
                if let user = authResult?.user {
                   self.db.collection("pl_users").document(user.uid).setData([
                        "firstname": firstname,
                        "lastname": lastname,
                        "email": email,
                    ])
                    completionHandler(nil)
                } else {
                    completionHandler(.wrongPassword)
                }
            }
        }
    }
    
    func signIn(email: String, pass: String, completionHandler: @escaping (_ error: AuthErrorCode?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let errorCode = AuthErrorCode(rawValue: error._code) {
                completionHandler(errorCode)
            } else {
                print("success")
                completionHandler(nil)
            }
        }
    }
    
    func signOut(completionBlock: @escaping (_ success: Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completionBlock(true)
        } catch let signOutError as NSError {
            completionBlock(false)
          print ("Error signing out: %@", signOutError)
        }
    }

}
