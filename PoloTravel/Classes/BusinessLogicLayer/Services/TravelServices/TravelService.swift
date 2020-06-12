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
    
    // Get days datas for the current travel
    func currentTravelDays(completionHandler: @escaping (_ result: [TravelDay]?) -> Void){
        currentTravel() { result in
            if let currentTravel = result {
                completionHandler(currentTravel.daysDatas)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    // Convert travels datas from Firebase format to Model format
    func convertTravelsToModels(travels: [NSDictionary], completionHandler: @escaping (_ result: [Travel]) -> Void) {
        var travelsConverted: [Travel] = []
        
        travels.forEach { travel in
            let startDateTS = travel["startDate"] as! Timestamp
            let startDate = startDateTS.dateValue()
            
            let endDateTS = travel["endDate"] as! Timestamp
            let endDate = endDateTS.dateValue()
            
            let price = travel["price"] as! Int
            let gift = travel["gift"] as! Bool
            
            let daysDatasInitial = travel["daysDatas"] as! NSArray
            
            convertDaysDatasToModels(daysDatas: daysDatasInitial) { daysDatas in
                travelsConverted.append(Travel(startDate: startDate, endDate: endDate, price: price, travelGear: ["zz", "zz"], daysDatas: daysDatas, gift: gift))
            }
        }
        
        completionHandler(travelsConverted)
    }
    
    // Convert days datas from Firebase format to Model format
    func convertDaysDatasToModels(daysDatas: NSArray, completionHandler: @escaping (_ result: [TravelDay]) -> Void) {
        var daysDatasConverted: [TravelDay] = []
        
        daysDatas.forEach { day in
            let travelDay = day as! NSDictionary
            let dateTS = travelDay["date"] as! Timestamp
            let date = dateTS.dateValue()
            

            daysDatasConverted.append(
                TravelDay(day: date,
                          price: travelDay["price"] as! Int,
                          items: travelDay["items"] as! [NSDictionary]
                )
            )
        }
        completionHandler(daysDatasConverted)
    }
    
    
}
