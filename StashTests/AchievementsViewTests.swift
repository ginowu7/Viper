//
//  AchievementsViewTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsViewTests: XCTestCase {

    lazy var view: AchievementsView = {
        let view =  AchievementsView()
        view.presenter = presenterSpy
        return view
    }()

    let presenterSpy = AchievementsViewToPresenterProtocolSpy()

    override func setUp() {
        super.setUp()
        view.loadView()
    }

    func test_viewDidLoad_calls_updateView() {
        view.viewDidLoad()
        XCTAssertTrue(presenterSpy.didCallUpdateView)
    }

    func test_viewDidLoad_configuresBarButonItem() {
        view.viewDidLoad()
        XCTAssertNotNil(view.navigationItem.rightBarButtonItem)
    }

    func test_viewDidLoad_configuresTableViewWithContentInset() {
        view.viewDidLoad()
        let expected = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        XCTAssertEqual(view.tableView.contentInset, expected)
    }

    func test_showError_presents_alertController() {
        UIApplication.shared.keyWindow?.rootViewController = view
        view.showError()
        XCTAssertTrue(view.presentedViewController is UIAlertController)
    }

    func test_showAchievements_reloads_tableView() {
        let tableViewSpy = UITableViewSpy()
        view.tableView = tableViewSpy
        view.showAchievements([AchievementFactory.create()], overview: AchievementOverviewFactory.create())
        XCTAssertTrue(tableViewSpy.didCallReloadData)
    }

    func test_showAchievements_updates_navigationTitle() {
        view.showAchievements([AchievementFactory.create()], overview: AchievementOverviewFactory.create())
        XCTAssertEqual(view.navigationItem.title, "Test title")
    }

    func test_cellForRowAt_returns_AchievementCell_type() {
        view.viewDidLoad()
        view.achievements = [AchievementFactory.create()]
        let actual = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(actual is AchievementCell)
    }

    func test_numberOfRowsInSection() {
        view.viewDidLoad()
        view.achievements = [AchievementFactory.create()]
        let expected = 1
        let actual = view.tableView(view.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actual, expected)
    }
}
