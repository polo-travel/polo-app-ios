//
//  Comment.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 09/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct Comment {
  let text: String
  let date: Date
  let user: String
    
  init(text: String, date: Date, user: String) {
      self.text = text
      self.date = date
      self.user = user
  }
}
