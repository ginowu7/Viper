//
//  AchievementOverviewFactory.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
@testable import Stash

enum AchievementOverviewFactory {

    static func create() -> AchievementOverview {
        return AchievementOverview (title: "Test title")
    }
}
