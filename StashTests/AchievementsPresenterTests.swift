//
//  AchievementsPresenterTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsPresenterTests: XCTestCase {

    lazy var presenter: AchievementsPresenter = {
        let presenter = AchievementsPresenter()
        presenter.interactor = interactorSpy
        presenter.view = viewSpy
        return presenter
    }()
    let interactorSpy = AchievementsPresenterToInteractorProtocolSpy()
    let viewSpy = AchievementsPresenterToViewProtocolSpy()
    
    func test_updateView_calls_interactor_fetchAchievements() {
        presenter.updateView()
        XCTAssertTrue(interactorSpy.didCallFetchAchievements)
    }

    func test_fetchSucceeded_calls_view_showAchievements() {
        presenter.fetchSucceeded([AchievementFactory.create()], overview: AchievementOverviewFactory.create())
        XCTAssertTrue(viewSpy.didCallShowAchievements)
    }

    func test_fetchFailed_calls_view_showError() {
        presenter.fetchFailed()
        XCTAssertTrue(viewSpy.didCallShowError)
    }
}
