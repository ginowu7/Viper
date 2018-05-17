//
//  AchievementsView.swift
//  Stash
//
//  Created by Gino Wu on 5/14/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class AchievementsView: UITableViewController {

    var presenter: AchievementsViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.updateView()
    }
}

extension AchievementsView: AchievementsPresenterToViewProtocol {

    func showError() {
        let controller = UIAlertController(title: "Whoops", message: "Please try again later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        controller.addAction(okAction)
        present(controller, animated: true)
    }

    func showAchievements(_ achievements: [Achievement], display: AchievementDisplay) {
        let controller = UIAlertController(title: "GOT IT", message: "GOT IT", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        controller.addAction(okAction)
        present(controller, animated: true)
    }
}


