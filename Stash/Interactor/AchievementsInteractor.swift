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

    weak var presenter: AchievementsInteractorToPresenterProtocol?

    // IRL - replace apiclient with wrapper around a networking library - or NSURLSession
    init(apiClient: APIClient) {
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
