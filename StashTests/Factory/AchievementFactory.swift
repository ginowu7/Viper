//
//  AchievementFactory.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
@testable import Stash

enum AchievementFactory {

    static func create() -> Achievement {
        return Achievement(
            id: 1,
            level: "4",
            progress: 20,
            total: 50,
            image: "http://some_image",
            isAccessible: true
        )
    }
}
