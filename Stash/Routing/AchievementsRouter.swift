//
//  AchievementsRouter.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class AchievementsRouter: AchievementsPresenterToRouterProtocol {
    static func create() -> UIViewController {
        let view = AchievementsView()
        var presenter: AchievementsViewToPresenterProtocol & AchievementsInteractorToPresenterProtocol = AchievementsPresenter()
        var interactor: AchievementsPresenterToInteractorProtocol = AchievementsInteractor()
        let router: AchievementsPresenterToRouterProtocol = AchievementsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
