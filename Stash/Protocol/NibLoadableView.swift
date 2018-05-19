//
//  NibLoadableView.swift
//  Stash
//
//  Created by Gino Wu on 5/19/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static func create(viewIndex: Int = 0, owner: Any? = nil, options: [AnyHashable: Any]? = nil) -> Self {
        let bundle = Bundle(for: Self.self)
        guard let view = bundle.loadNibNamed(Self.nibName, owner: owner, options: options)?[viewIndex] as? Self else {
            fatalError("Could not instantiate \(Self.self) from nib -- have you conformed to the NibLoadable protocol?")
        }
        return view
    }
}

extension UITableViewCell: NibLoadableView {}


