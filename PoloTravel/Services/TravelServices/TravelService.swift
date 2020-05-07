//
//  TravelService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import FirebaseFirestore

class TravelService {
    func getTravels(completionHandler: @escaping (_ result: [Travel]?) -> Void) {
        UserService().currentUser() { result  in
            if let user = result {
                let travels = user.travels
                var travelsConverted: [Travel] = []
                var daysDatas:[TravelDay] = []
                
                travels?.forEach { travel in
                    let startDateTS = travel["startDate"] as! Timestamp
                    let startDate = startDateTS.dateValue()
                    
                    let endDateTS = travel["endDate"] as! Timestamp
                    let endDate = endDateTS.dateValue()
                    
                    let price = travel["price"] as! Int
                    
                    travelsConverted.append(Travel(startDate: startDate, endDate: endDate, price: price, travelGear: ["zz", "zz"], daysDatas: []))
                    
                }
                print(travelsConverted)
                
                
                let testTravels = [
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
                
                completionHandler(testTravels)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func currentTravel(completionHandler: @escaping (_ result: Travel?) -> Void) {
        getTravels() { result in
            if let travels = result {
                completionHandler(travels[0])
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func currentTravelDays(completionHandler: @escaping (_ result: [TravelDay]?) -> Void){
        currentTravel() { result in
            if let currentTravel = result {
                completionHandler(currentTravel.daysDatas)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    
    var photoList:Photo = []
}
