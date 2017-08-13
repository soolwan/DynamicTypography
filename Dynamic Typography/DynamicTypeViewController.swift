//
//  DynamicTypeViewController.swift
//  Dynamic Typography
//
//  Created by Sean Coleman on 8/1/17.
//  Copyright © 2017 Sean Coleman. All rights reserved.
//

import UIKit

class DynamicTypeViewController: UIViewController {

    // System

    func systemTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 28.0)
    }

    func systemBodyFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }

    // Dynamic

    func dynamicTitleFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .title1)
    }

    func dynamicBodyFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .body)
    }

    // Custom Dynamic

    func customDynamicTitleFont() -> UIFont {
        let customFont = UIFont(name: K.gabrielleFont, size: 28)! // seed with a good size.
        return UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
    }

    func customDynamicBodyFont() -> UIFont {
        let customFont = UIFont(name: K.gabrielleFont, size: 18)! // seed with a good size.
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
    }

    func dynamicTypeDemo() {
        titleLabel.adjustsFontForContentSizeCategory = true
        bodyLabel.adjustsFontForContentSizeCategory = true

        titleLabel.font = customDynamicTitleFont()
        bodyLabel.font = customDynamicBodyFont()

        titleLabel.font = dynamicTitleFont()
        bodyLabel.font = dynamicBodyFont()

        titleLabel.font = systemTitleFont()
        bodyLabel.font = systemBodyFont()

        titleLabel.text = K.title
        bodyLabel.text = K.body

        baselineConstraint.isActive = false // Deactivate the equivalent constraint set in IB.

        // Vertical Baseline System Spacing Constraint. Adjusts with Dynamic Type!
        bodyLabel.firstBaselineAnchor.constraintEqualToSystemSpacingBelow(
            titleLabel.lastBaselineAnchor, multiplier: 1.0).isActive = true
    }

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var baselineConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicTypeDemo()
    }

    struct K {

        static let gabrielleFont = "Gabrielle"
        static let title = "Foxes & Dogs"
        static let body = "The quick brown fox jumps over the lazy dog."
    }
}
