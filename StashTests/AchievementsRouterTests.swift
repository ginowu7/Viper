//
//  AchievementsRouterTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash
class AchievementsRouterTests: XCTestCase {

    func test_create_returns_AchievementsView_type() {
        let actual = AchievementsRouter.create()
        XCTAssertTrue(actual is AchievementsView)
    }

    func test_create_sets_AchievementsView_properly() {
        guard let view = AchievementsRouter.create() as? AchievementsView else {
            return XCTFail("Did not allocate AchievementsView properly")
        }
        XCTAssertNotNil(view.presenter)
        XCTAssertNotNil(view.presenter?.view)
        XCTAssertNotNil(view.presenter?.router)
        XCTAssertNotNil(view.presenter?.interactor)
    }
}
