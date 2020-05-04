//
//  TravelDay.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct TravelDay: Decodable {
  let day: Date
  let price: Int
  let morningActivity: TravelActivity
  let afternoonActivity: TravelActivity
  let meal: TravelActivity
}
