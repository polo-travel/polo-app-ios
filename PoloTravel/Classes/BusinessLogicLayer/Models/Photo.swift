//
//  Photo.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 23/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

struct PhotoElement: Codable, Equatable {
    let imageURL, userId, userName, description, imageId, userPhotoURL: String
    let likes: Int
    let publicationDate: Date

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case userId, likes, userName, description, imageId, userPhotoURL
        case publicationDate
    }
}

typealias Photo = [PhotoElement]

