//
//  TravelChoices.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 05/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct TravelChoices: Decodable {
  var nbPeople: String?
  var danger: Int?
  var forestLosted: Int?
  var sleepPlace: Int?
  var date: [Date]?
  var budget: Float?
    
  init(nbPeople: String? = nil, danger: Int? = nil, forestLosted: Int? = nil, sleepPlace: Int? = nil, date: [Date]? = nil, budget: Float? = nil) {
      self.nbPeople = nbPeople
      self.danger = danger
      self.forestLosted = forestLosted
      self.sleepPlace = sleepPlace
      self.date = date
      self.budget = budget
  }
}
