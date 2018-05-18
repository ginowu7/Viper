//
//  AchievementsProtocol.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

protocol AchievementsViewToPresenterProtocol {
    var view: AchievementsPresenterToViewProtocol? { get set }
    var interactor: AchievementsPresenterToInteractorProtocol? { get set }
    var router: AchievementsPresenterToRouterProtocol? { get set }
    func updateView()
}

protocol AchievementsPresenterToViewProtocol {
    func showAchievements(_ achievements: [Achievement], overview: AchievementOverview)
    func showError()
}

protocol AchievementsPresenterToInteractorProtocol {
    var presenter: AchievementsInteractorToPresenterProtocol? { get set }
    func fetchAchievements()
}

protocol AchievementsInteractorToPresenterProtocol {
    func fetchFailed()
    func fetchSucceeded(_ achievements: [Achievement], overview: AchievementOverview)
}

protocol AchievementsPresenterToRouterProtocol {
    static func create() -> UIViewController
}
