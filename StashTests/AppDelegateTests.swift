//
//  AppDelegateTests.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import XCTest
@testable import Stash

class AppDelegateTests: XCTestCase {

    let appDelegate = AppDelegate()

    func test_didFinishLaunchingWithOptions_rootViewController_is_achievementView() {
        _ = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        guard let rootViewController = appDelegate.window?.rootViewController as? StashNavigationController else {
            return XCTFail("Incorrect navigation type")
        }
        XCTAssertTrue(rootViewController.childViewControllers.last is AchievementsView)
    }
    
}
