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
        apiClient.remoteCall(withMethod: "GET", path: "/api/achievements", params: nil) { [weak self] success, response in
            guard let response = response, let wrapper = try? JSONDecoder().decode(Wrapper.self, from: response), success else {
                self?.presenter?.fetchFailed()
                return
            }
            self?.presenter?.fetchSucceeded(wrapper.achievements, overview: wrapper.overview)
        }
    }
}

fileprivate struct Wrapper: Decodable {
    let achievements: [Achievement]
    let overview: AchievementOverview
}
