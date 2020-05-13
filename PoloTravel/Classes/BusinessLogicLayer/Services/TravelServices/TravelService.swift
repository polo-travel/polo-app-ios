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
                
                if let travels = travels {
                    self.convertTravelsToModels(travels: travels) { result in
                        
                        completionHandler(result)
                    }
                } else {
                    completionHandler(nil)
                }
                
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func currentTravel(completionHandler: @escaping (_ result: Travel?) -> Void) {
        var currentTravel: Travel?
        getTravels() { result in
            if let travels = result {
                travels.forEach { travel in
                    if (travel.startDate <= Date().midnight && travel.endDate >= Date().midnight) {
                        currentTravel = travel
                    }
                }
                completionHandler(currentTravel)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func nextTravel(completionHandler: @escaping (_ result: Travel?) -> Void) {
        var nextTravel: Travel?
        getTravels() { result in
            if let travels = result {
                travels.forEach { travel in
                    if (travel.startDate > Date()) {
                        nextTravel = travel
                    }
                }
                completionHandler(nextTravel)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func pastTravels(completionHandler: @escaping (_ result: [Travel]?) -> Void) {
        var pastTravels: [Travel] = []
        getTravels() { result in
            if let travels = result {
                travels.forEach { travel in
                    if travel.endDate < Date().midnight {
                        pastTravels.append(travel)
                    }
                }
                completionHandler(pastTravels)
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
    
    func convertTravelsToModels(travels: [NSDictionary], completionHandler: @escaping (_ result: [Travel]) -> Void) {
        var travelsConverted: [Travel] = []
        
        travels.forEach { travel in
            let startDateTS = travel["startDate"] as! Timestamp
            let startDate = startDateTS.dateValue()
            
            let endDateTS = travel["endDate"] as! Timestamp
            let endDate = endDateTS.dateValue()
            
            let price = travel["price"] as! Int
            
            let daysDatasInitial = travel["daysDatas"] as! NSArray
            
            convertDaysDatasToModels(daysDatas: daysDatasInitial) { daysDatas in
                travelsConverted.append(Travel(startDate: startDate, endDate: endDate, price: price, travelGear: ["zz", "zz"], daysDatas: daysDatas))
            }
        }
        
        completionHandler(travelsConverted)
    }
    
    func convertDaysDatasToModels(daysDatas: NSArray, completionHandler: @escaping (_ result: [TravelDay]) -> Void) {
        var daysDatasConverted: [TravelDay] = []
        
        daysDatas.forEach { day in
            let travelDay = day as! NSDictionary
            let dateTS = travelDay["date"] as! Timestamp
            let date = dateTS.dateValue()
            
            let morningActivity = travelDay["morningActivity"] as! NSDictionary
            let meal = travelDay["meal"] as! NSDictionary
            let afternoonActivity = travelDay["afternoonActivity"] as! NSDictionary

            daysDatasConverted.append(
                TravelDay(day: date,
                          price: travelDay["price"] as! Int,
                          morningActivity: TravelActivity(price: morningActivity["price"] as! Int,
                                                          localization: morningActivity["localization"] as! [Double],
                                                          indication: morningActivity["indication"] as! String),
                          
                          afternoonActivity: TravelActivity(price: afternoonActivity["price"] as! Int,
                                                            localization: afternoonActivity["localization"] as! [Double],
                                                            indication: afternoonActivity["indication"] as! String),
                          
                          meal: TravelActivity(price: meal["price"] as! Int,
                                               localization: meal["localization"] as! [Double],
                                               indication: meal["indication"] as! String)
                )
            )
        }
        completionHandler(daysDatasConverted)
    }
    
    
}
