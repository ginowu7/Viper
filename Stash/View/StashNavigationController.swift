//
//  StashNavigationController.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class StashNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationBar.isTranslucent = false
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [.font: UIFont.navigationTitle, .foregroundColor: UIColor.primaryText]
        navigationBar.barTintColor = .tintBarColor
    }
}
