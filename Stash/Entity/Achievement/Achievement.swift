//
//  Achievement.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

struct Achievement {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let image: URL?
    let accessible: Bool
}
