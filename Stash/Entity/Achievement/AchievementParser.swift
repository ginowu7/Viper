//
//  AchievementParser.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

struct AchievementParser: Parser {

    static func parse(from dictionary: [AnyHashable : Any]) -> Achievement? {
        guard let id = dictionary["id"] as? Int,
            let level = dictionary["level"] as? String,
            let progress = dictionary["progress"] as? Int,
            let total = dictionary["total"] as? Int,
            let image = dictionary["bg_image_url"] as? String,
            let imageURL = URL(string: image),
            let accessible = dictionary["accessible"] as? Bool else { return nil}
        return Achievement(
            id: id,
            level: level,
            progress: progress,
            total: total,
            image: imageURL,
            accessible: accessible
        )
    }
}
