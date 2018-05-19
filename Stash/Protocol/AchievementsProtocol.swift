//
//  AchievementsProtocol.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

protocol AchievementsViewToPresenterProtocol: class {
    var view: AchievementsPresenterToViewProtocol? { get set }
    var interactor: AchievementsPresenterToInteractorProtocol? { get set }
    var router: AchievementsPresenterToRouterProtocol? { get set }
    func updateView()
}

protocol AchievementsPresenterToViewProtocol: class {
    func showAchievements(_ achievements: [Achievement], overview: AchievementOverview)
    func showError()
}

protocol AchievementsPresenterToInteractorProtocol: class {
    var presenter: AchievementsInteractorToPresenterProtocol? { get set }
    func fetchAchievements()
}

protocol AchievementsInteractorToPresenterProtocol: class {
    func fetchFailed()
    func fetchSucceeded(_ achievements: [Achievement], overview: AchievementOverview)
}

protocol AchievementsPresenterToRouterProtocol: class {
    static func create() -> UIViewController
}
