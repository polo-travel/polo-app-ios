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
  var danger: Int?
  var forestLosted: Int?
  var sleepPlace: Int?
  var date: [Date]?
  var budget: Int?
  var adventurerLevel: Int?
    
    init(gift: Bool? = nil, nbPeople: String? = nil, danger: Int? = nil, forestLosted: Int? = nil, sleepPlace: Int? = nil, date: [Date]? = nil, budget: Int? = nil, adventurerLevel: Int? = nil) {
      self.gift = gift
      self.nbPeople = nbPeople
      self.danger = danger
      self.forestLosted = forestLosted
      self.sleepPlace = sleepPlace
      self.date = date
      self.budget = budget
      self.adventurerLevel = adventurerLevel
  }
}
