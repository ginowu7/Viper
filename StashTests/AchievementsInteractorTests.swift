//
//  AchievementsInteractorTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsInteractorTests: XCTestCase {

    lazy var interactor: AchievementsInteractor = {
        let interactor = AchievementsInteractor(apiClient: apiClientMock)
        interactor.presenter = presenterSpy
        return interactor
    }()

    let apiClientMock = APIClientMock()
    let presenterSpy = AchievementsInteractorToPresenterProtocolSpy()

    func test_fetchAchievements_successful() {
        apiClientMock.jsonFilename = "achievements"
        apiClientMock.successMock = true
        interactor.fetchAchievements()
        XCTAssertTrue(presenterSpy.didCallFetchSucceeded)
    }

    func test_fetchAchievements_failed() {
        apiClientMock.successMock = false
        interactor.fetchAchievements()
        XCTAssertTrue(presenterSpy.didCallFetchFailed)
    }
}
