//
//  AchievementCell.swift
//  Stash
//
//  Created by Gino Wu on 5/18/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class AchievementCell: UITableViewCell {

    @IBOutlet private weak var levelContainerView: UIView! {
        didSet {
            levelContainerView.backgroundColor = .white
            levelContainerView.alpha = 0.9
            levelContainerView.layer.cornerRadius = 50
        }
    }
    @IBOutlet weak var backgroundImageContainerView: UIView! {
        didSet {
            backgroundImageContainerView.backgroundColor = .clear
            backgroundImageContainerView.layer.cornerRadius = 2.0
            backgroundImageContainerView.layer.shadowRadius = 5.0
            backgroundImageContainerView.layer.shadowOpacity = 0.2
        }
    }
    @IBOutlet private weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.layer.cornerRadius = 8.0
            backgroundImageView.clipsToBounds = true
            backgroundImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet private weak var levelLabel: UILabel! {
        didSet {
            levelLabel.text = "Level" // Should localize string here
            levelLabel.font = .headerSmall
        }
    }

    @IBOutlet private weak var levelValueLabel: UILabel! {
        didSet {
            levelValueLabel.font = .headerExtraLarge
        }
    }
    @IBOutlet private weak var progressView: UIProgressView! {
        didSet {
            progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
            progressView.layer.cornerRadius = 5.0
            progressView.clipsToBounds = true
            progressView.trackTintColor = .white
            progressView.progressTintColor = UIColor(displayP3Red: 117/255.0, green: 200/255.0, blue: 98/255.0, alpha: 1.0)
            progressView.subviews.forEach {
                $0.layer.cornerRadius = 5.0
                $0.clipsToBounds = true
            }
        }
    }
    @IBOutlet private weak var leadingProgressLabel: UILabel! {
        didSet {
            leadingProgressLabel.font = .headerBoldSmall
            leadingProgressLabel.textColor = .white
        }
    }
    @IBOutlet private weak var trailingProgressLabel: UILabel! {
        didSet {
            trailingProgressLabel.font = .headerBoldSmall
            trailingProgressLabel.textColor = .white
        }
    }
    @IBOutlet private weak var transparentView: UIView!

    var backgroundImageUrl: URL? {
        didSet {
            backgroundImageView.sd_setImage(with: backgroundImageUrl, completed: nil)
        }
    }

    var level: String? {
        didSet {
            levelValueLabel.text = level
        }
    }

    var isAccessible: Bool = true {
        didSet {
            if isAccessible {
                transparentView.isHidden = true
                isUserInteractionEnabled = false
                backgroundImageContainerView.layer.shadowColor = UIColor.black.cgColor

            } else {
                transparentView.alpha = 0.6
                isUserInteractionEnabled = true
                backgroundImageContainerView.layer.shadowColor = UIColor.white.cgColor
            }
        }
    }

    func progress(_ value: Float, total: Float) {
        progressView.progress = value / total
        leadingProgressLabel.text = "\(Int(value))pts"
        trailingProgressLabel.text = "\(Int(total))pts"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        level = nil
        backgroundImageUrl = nil
        progress(0, total: 0)
        isAccessible = true
    }

}
