//
//  AchievementCellTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementCellTests: XCTestCase {

    let cell: AchievementCell = AchievementCell.create()

    func test_awakeFromNib() {
        cell.awakeFromNib()
        XCTAssertEqual(cell.selectionStyle, .none)
    }

    func test_prepareForReuse() {
        cell.prepareForReuse()
        XCTAssertNil(cell.level)
        XCTAssertNil(cell.backgroundImageUrl)
        XCTAssertTrue(cell.isAccessible)
    }

    func test_isAccessible_true_enables_userInteraction() {
        cell.isAccessible = true
        XCTAssertTrue(cell.isUserInteractionEnabled)
    }

    func test_isAccessible_false_disables_userInteraction() {
        cell.isAccessible = false
        XCTAssertFalse(cell.isUserInteractionEnabled)
    }
}
