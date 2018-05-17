//
//  Parser.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

protocol Parser {
    associatedtype T
    static func parse(from dictionary: [AnyHashable: Any]) -> T?
}
