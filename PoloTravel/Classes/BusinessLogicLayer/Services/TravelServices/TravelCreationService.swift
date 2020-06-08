//
//  TravelCreationService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 06/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import UIKit

class TravelCreationService {
    
    let db = Firestore.firestore()
    let userManager = UserService()
    var user: User?
    
    func addTravelToCurrentUser(travelChoices:TravelChoices, completionBlock: @escaping (_ success: Bool) -> Void) {
            userManager.currentUser() { result  in
                self.user = result
                
                if let dateStart = travelChoices.date?[0], let dateEnd = travelChoices.date?[1] {
                    self.createDaysDatas(date1: dateStart, date2: dateEnd) { daysDatas in
                        self.db.collection("pl_users").document(self.user!.uid).updateData([
                            "travels": FieldValue.arrayUnion([
                                [
                                    "daysDatas": daysDatas as Any,
                                    "startDate": travelChoices.date?[0] as Any,
                                    "endDate": travelChoices.date?[1] as Any,
                                    "price": 175,
                                ]
                             ])
                        ])
                       completionBlock(true)
                    }
                }
            }
    }
    
    func getTravelPack(pack: Int, completionHandler: @escaping (_ travelPack: NSDictionary?) -> Void) {
        var travelPack: NSDictionary?
        let docRef = db.collection("pl_resources").document("r_travel_resources")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let travelPacks = document.get("travel_packs") as! [Any]
                travelPack = travelPacks[pack] as? NSDictionary
              
              completionHandler(travelPack)
            } else {
                print("No travel pack")
                completionHandler(nil)
            }
        }
    }
    
    func createDaysDatas(date1: Date, date2: Date, completionHandler: @escaping (_ daysDatas: [Any]?) -> Void) {
        var daysDatas: [Any] = []
        
        let numberOfDays = DateUtils.daysBetween(start: date1, end: date2)
        
        self.getTravelPack(pack: 0) { travelPack in
            let travelPackDays = travelPack?["days_datas"] as! NSArray
            for i in 0...numberOfDays {
                let travelPackDay = travelPackDays[i] as! NSDictionary
                print(travelPackDay)
                daysDatas.append(["date": Calendar.current.date(byAdding: .day, value: i, to: date1)!, "price": 200, "items": travelPackDay["items"]])
            }
            completionHandler(daysDatas)
        }
    
        
        
    }
}
