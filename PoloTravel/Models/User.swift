//
//  User.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 01/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct User: Decodable {
  let firstName: String
  let lastName: String
  let uid: String
  let email: String
  let photoURL: URL?
  let travels: [Travel]?
    
  init(firstName: String, lastName: String, uid: String, email: String, photoURL: URL? = nil, travels: [Travel]? = nil) {
      self.firstName = firstName
      self.lastName = lastName
      self.uid = uid
      self.email = email
      self.photoURL = photoURL
      self.travels = travels
  }
}
