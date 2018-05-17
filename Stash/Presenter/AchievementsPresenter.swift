//
//  AchievementsPresenter.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

class AchievementsPresenter: AchievementsViewToPresenterProtocol {
    var router: AchievementsPresenterToRouterProtocol?
    var view: AchievementsPresenterToViewProtocol?
    var interactor: AchievementsPresenterToInteractorProtocol?

    func updateView() {
        interactor?.fetchAchievements()
    }
}

extension AchievementsPresenter: AchievementsInteractorToPresenterProtocol {
    func fetchSucceeded(_ achievements: [Achievement], display: AchievementDisplay) {
        view?.showAchievements(achievements, display: display)
    }

    func fetchFailed() {
        view?.showError()
    }
}