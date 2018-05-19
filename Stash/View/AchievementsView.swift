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
        configureBarButtonItem()
        presenter?.updateView()
    }

    private func configureBarButtonItem() {
        let button = UIButton(type: .infoLight)
        button.tintColor = .white
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButtonItem
    }

    private func configureTableView() {
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: String(describing: AchievementCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: AchievementCell.self))
    }

}

extension AchievementsView: AchievementsPresenterToViewProtocol {
    func showError() {
        // TODO: Localize Strings
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Create helper to move boiler plate to extension
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AchievementCell.self)) as! AchievementCell
        AchievementCellFormatter.format(cell: cell, achievement: achievements[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
}


