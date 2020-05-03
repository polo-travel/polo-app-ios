//
//  TravelActivity.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct TravelActivity: Decodable {
  let price: Int
  let localization: [Double]
  let indication: String
}
