//
//  User.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 01/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct User {
  let firstName: String
  let lastName: String
  let uid: String
  let email: String
  let photoURL: URL?
  let travels: [NSDictionary]?
    
  init(firstName: String, lastName: String, uid: String, email: String, photoURL: URL? = nil, travels: [NSDictionary]? = nil) {
      self.firstName = firstName
      self.lastName = lastName
      self.uid = uid
      self.email = email
      self.photoURL = photoURL
      self.travels = travels
  }
}
