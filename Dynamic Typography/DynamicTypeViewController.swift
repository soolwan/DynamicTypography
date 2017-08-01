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
        let customFont = UIFont(name: K.gabrielleFont, size: 28)!
        return UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
    }

    func customDynamicBodyFont() -> UIFont {
        let customFont = UIFont(name: K.gabrielleFont, size: 18)!
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
    }

    func dynamicTypeDemo() {
        titleLabel.adjustsFontForContentSizeCategory = true
        bodyLabel.adjustsFontForContentSizeCategory = true

        titleLabel.font = systemTitleFont()
//        titleLabel.font = dynamicTitleFont()
//        titleLabel.font = customDynamicTitleFont()

        bodyLabel.font = systemBodyFont()
//        bodyLabel.font = dynamicBodyFont()
//        bodyLabel.font = customDynamicBodyFont()

        titleLabel.text = K.title
        bodyLabel.text = K.body

        // Baseline constraints set in IB or code using System Spacing that responds to Dynamic Type.
//        baselineConstraint.isActive = false // Deactivate the equivalent constraint set in IB.
//
//        bodyLabel.firstBaselineAnchor.constraintEqualToSystemSpacingBelow(
//            titleLabel.lastBaselineAnchor, multiplier: 2.0).isActive = true
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
