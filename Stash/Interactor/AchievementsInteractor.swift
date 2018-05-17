//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

class AchievementsInteractor: AchievementsPresenterToInteractorProtocol {

    let apiClient: APIClient
    var presenter: AchievementsInteractorToPresenterProtocol?

    // Replace with real APIClient for actual network activity - using mock for interview purposes
    init(apiClient: APIClient = APIClientMock(jsonFilename: "achievements")) {
        self.apiClient = apiClient
    }

    func fetchAchievements() {
        apiClient.remoteCall(withMethod: "GET", path: "/api/achievements", params: nil) { success, response in
            guard let response = response as? [AnyHashable: Any],
                let achievementsResponse = response["achievements"] as? [[AnyHashable: Any]],
                let displayResponse = response["overview"] as? [AnyHashable: Any],
                let achievementDisplay = AchievementDisplayParser.parse(from: displayResponse) else {
                self.presenter?.fetchFailed()
                return
            }
            let achievements = achievementsResponse.compactMap(AchievementParser.parse(from:))
            self.presenter?.fetchSucceeded(achievements, display: achievementDisplay)
        }
    }
}

