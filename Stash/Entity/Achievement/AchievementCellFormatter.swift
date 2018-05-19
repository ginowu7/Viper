//
//  AchievementCellFormatter.swift
//  Stash
//
//  Created by Gino Wu on 5/18/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

enum AchievementCellFormatter {

    static func format(cell: AchievementCell, achievement: Achievement) {
        cell.backgroundImageUrl = achievement.imageUrl
        cell.level = achievement.level
        cell.progress(achievement.progress, total: achievement.total)
        cell.isAccessible = achievement.isAccessible
    }
}
