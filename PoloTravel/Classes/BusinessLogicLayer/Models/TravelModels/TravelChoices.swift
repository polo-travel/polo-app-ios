//
//  TravelChoices.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 05/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct TravelChoices: Decodable {
  var gift: Bool?
  var nbPeople: String?
  var q1: Int?
  var q2: Int?
  var q3: Int?
  var date: [Date]?
  var budget: Int?
  var adventurerLevel: Int?
  var finalPoloImage: String?
    
    init(gift: Bool? = nil, nbPeople: String? = nil, q1: Int? = nil, q2: Int? = nil, q3: Int? = nil, date: [Date]? = nil, budget: Int? = nil, adventurerLevel: Int? = nil, finalPoloImage:String? = nil) {
      self.gift = gift
      self.nbPeople = nbPeople
      self.q1 = q1
      self.q2 = q2
      self.q3 = q3
      self.date = date
      self.budget = budget
      self.adventurerLevel = adventurerLevel
      self.finalPoloImage = finalPoloImage
  }
}
