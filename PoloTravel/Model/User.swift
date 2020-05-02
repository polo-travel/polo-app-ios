//
//  User.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 01/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct User: Decodable {
  let firstName: String?
  let lastName: String?
  let uid: String
  let email: String?
  let photoURL: URL?
}
