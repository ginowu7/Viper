//
//  AchievementsProtocolSpies.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
@testable import Stash

class AchievementsInteractorToPresenterProtocolSpy: AchievementsInteractorToPresenterProtocol {
    var didCallFetchFailed = false
    var didCallFetchSucceeded = false

    func fetchFailed() {
        didCallFetchFailed = true
    }
    func fetchSucceeded(_ achievements: [Achievement], overview: AchievementOverview) {
        didCallFetchSucceeded = true
    }
}

class AchievementsPresenterToViewProtocolSpy: AchievementsPresenterToViewProtocol {
    var didCallShowAchievements = false
    var didCallShowError = false

    func showAchievements(_ achievements: [Achievement], overview: AchievementOverview) {
        didCallShowAchievements = true
    }
    func showError() {
        didCallShowError = true
    }
}

class AchievementsPresenterToInteractorProtocolSpy: AchievementsPresenterToInteractorProtocol {
    var presenter: AchievementsInteractorToPresenterProtocol?

    var didCallFetchAchievements = false
    func fetchAchievements() {
        didCallFetchAchievements = true
    }
}

class AchievementsViewToPresenterProtocolSpy: AchievementsViewToPresenterProtocol {
    var view: AchievementsPresenterToViewProtocol?
    var interactor: AchievementsPresenterToInteractorProtocol?
    var router: AchievementsPresenterToRouterProtocol?

    var didCallUpdateView = false
    func updateView() {
        didCallUpdateView = true
    }
}
