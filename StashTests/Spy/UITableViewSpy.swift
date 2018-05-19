//
//  UITableViewSpy.swift
//  StashTests
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit
@testable import Stash

class UITableViewSpy: UITableView {

    var didCallReloadData = false
    override func reloadData() {
        didCallReloadData = true
    }
}
