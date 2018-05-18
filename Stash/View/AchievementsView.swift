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
    var overview: AchievementOverview? {
        didSet {
            navigationItem.title = overview?.title
        }
    }
    var achievements: [Achievement] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.updateView()
    }

    private func configureTableView() {
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: String(describing: AchievementCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: AchievementCell.self))
    }

}

extension AchievementsView: AchievementsPresenterToViewProtocol {
    func showError() {
        let controller = UIAlertController(title: "Whoops", message: "Please try again later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        controller.addAction(okAction)
        present(controller, animated: true)
    }

    func showAchievements(_ achievements: [Achievement], overview: AchievementOverview) {
        self.achievements = achievements
        self.overview = overview
    }
}

extension AchievementsView {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AchievementCell.self)) as! AchievementCell
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
}


