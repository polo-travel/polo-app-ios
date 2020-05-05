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
        var travels: [Travel]?
        var testTravels: [Travel]?
        
        if let user = user {
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          
          let docRef = db.collection("pl_users").document(user.uid)
          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                firstName = document.get("firstname") as? String
                lastName = document.get("lastname") as? String
                travels = document.get("travels") as? [Travel]

                testTravels = [
                    Travel(startDate: Date(timeIntervalSinceNow: 1728000),
                           endDate: Date(timeIntervalSinceNow: 1900800),
                           price: 145,
                           travelGear: ["Des chaussures de randonnée", "Un sac à dos étanche", "Un maillot de bain", "Une lampe torche"],
                           daysDatas: [
                            TravelDay(
                                day: Date(timeIntervalSinceNow: 1728000),
                                price: 45,
                                morningActivity: TravelActivity(price: 29, localization: [0.6, 4,6], indication: "indice"),
                                afternoonActivity: TravelActivity(price: 20, localization: [0.6, 4,6], indication: "indice"),
                                meal: TravelActivity(price: 15, localization: [0.6, 4,6], indication: "indice")
                            ),
                            TravelDay(
                                day: Date(timeIntervalSinceNow: 1814400),
                                price: 55,
                                morningActivity: TravelActivity(price: 29, localization: [0.6, 4,6], indication: "indice"),
                                afternoonActivity: TravelActivity(price: 20, localization: [0.6, 4,6], indication: "indice"),
                                meal: TravelActivity(price: 15, localization: [0.6, 4,6], indication: "indice")
                            ),
                            TravelDay(
                                day: Date(timeIntervalSinceNow: 1900800),
                                price: 45,
                                morningActivity: TravelActivity(price: 29, localization: [0.6, 4,6], indication: "indice"),
                                afternoonActivity: TravelActivity(price: 20, localization: [0.6, 4,6], indication: "indice"),
                                meal: TravelActivity(price: 15, localization: [0.6, 4,6], indication: "indice")
                            ),
                           ]
                    )
                    
                ]
                
                completionHandler(User(firstName: firstName ?? "", lastName: lastName ?? "", uid: uid, email: email ?? "", photoURL: photoURL, travels: testTravels))
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

