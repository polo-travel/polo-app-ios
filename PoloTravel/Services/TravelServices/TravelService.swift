//
//  TravelService.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

class TravelService {
    func getTravels(completionHandler: @escaping (_ result: [Travel]?) -> Void) {
        UserService().currentUser() { result  in
            if let user = result {
                completionHandler(user.travels)
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
