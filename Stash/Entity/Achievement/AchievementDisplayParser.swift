//
//  AchievementDisplayParser.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

struct AchievementDisplayParser: Parser {

    static func parse(from dictionary: [AnyHashable : Any]) -> AchievementDisplay? {
        guard let title = dictionary["title"] as? String else { return nil }
        return AchievementDisplay(title: title)
    }
}
