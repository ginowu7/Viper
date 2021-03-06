//
//  Achievement.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    let id: Int
    let level: String
    let progress: Float
    let total: Float
    let image: String
    let isAccessible: Bool
    var imageUrl: URL? {
        return URL(string: image)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case image = "bg_image_url"
        case isAccessible = "accessible"
    }
}
