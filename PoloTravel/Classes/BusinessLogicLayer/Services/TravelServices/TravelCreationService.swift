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
    
    func createDaysDatas(date1: Date, date2: Date, completionHandler: @escaping (_ daysDatas: [Any]?) -> Void) {
        var daysDatas: [Any] = []
        
        let numberOfDays = DateUtils.daysBetween(start: date1, end: date2)
        print("numberOfDays", numberOfDays, "date1", date1, "date2", date2)
        
        
        for i in 0...numberOfDays {
            daysDatas.append(["date": Calendar.current.date(byAdding: .day, value: i, to: date1)!, "price": 200, "morningActivity": ["price": 20, "localization": [45.754049903692284, 4.825830459594727], "indication": "Tourne à droite mon ami"], "meal": ["price": 20, "localization": [45.74695278493895, 4.844927787780762], "indication": "Mangerrrrrrrr !!!"], "afternoonActivity": ["price": 20, "localization": [45.7630023652255, 4.837932586669922], "indication": "Aprèsmidiiiii indication"]])
        }
        
        completionHandler(daysDatas)
    }
}
