//
//  Photo.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 23/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct PhotoElement: Codable, Equatable {
    let imageURL, userId, userName: String
    let likes: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case userId, likes, userName
    }
}

typealias Photo = [PhotoElement]

