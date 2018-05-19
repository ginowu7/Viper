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
        let presenter: AchievementsViewToPresenterProtocol & AchievementsInteractorToPresenterProtocol = AchievementsPresenter()
        // mocks the json for interview purpose
        let interactor: AchievementsPresenterToInteractorProtocol = AchievementsInteractor(apiClient: APIClientMock(jsonFilename: "achievements"))
        let router: AchievementsPresenterToRouterProtocol = AchievementsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
