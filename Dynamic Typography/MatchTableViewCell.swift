//
//  MatchTableViewCell.swift
//  Dynamic Typography
//
//  Created by Sean Coleman on 8/1/17.
//  Copyright © 2017 Sean Coleman. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.preferredContentSizeCategory > .extraExtraExtraLarge {
            scoresWidthConstraint.isActive = false
            matchStackView.axis = .vertical
        } else {
            matchStackView.axis = .horizontal
            layoutIfNeeded()
            scoresWidthConstraint.isActive = true
        }
    }

    func configure(with match: Match) {
        playerOneLabel.text = match.playerOne
        playerTwoLabel.text = match.playerTwo
    }

    @IBOutlet var matchStackView: UIStackView!
    @IBOutlet var scoresStackView: UIStackView!
    @IBOutlet var scoresWidthConstraint: NSLayoutConstraint!

    @IBOutlet var playerOneLabel: UILabel!
    @IBOutlet var playerTwoLabel: UILabel!
}
