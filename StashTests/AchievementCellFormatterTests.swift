//
//  AchievementCellFormatterTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementCellFormatterTests: XCTestCase {

    let cell = AchievementCell.create()
    let achievement = AchievementFactory.create()

    func test_format_sets_cell_properly() {
        AchievementCellFormatter.format(cell: cell, achievement: achievement)

        XCTAssertEqual(cell.backgroundImageUrl, achievement.imageUrl)
        XCTAssertEqual(cell.level, achievement.level)
        XCTAssertEqual(cell.isAccessible, achievement.isAccessible)
    }

}
