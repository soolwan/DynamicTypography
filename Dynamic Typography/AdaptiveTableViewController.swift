//
//  AdaptiveTableViewController.swift
//  Dynamic Typography
//
//  Created by Sean Coleman on 8/1/17.
//  Copyright © 2017 Sean Coleman. All rights reserved.
//

import UIKit

class AdaptiveTableViewController: UITableViewController {

    private var matches: [Match] = []

    private func setupMatches() {
        let matchData = [Match(playerOne: "Roger Federer", playerTwo: "Rafael Nadal"),
                         Match(playerOne: "Andy Murray", playerTwo: "Novak Djokovic"),
                         Match(playerOne: "Stan Wawrinka", playerTwo: "Marin Cilic"),
                         Match(playerOne: "Dominic Thiem", playerTwo: "Kei Nishikori"),
                         Match(playerOne: "Milos Raonic", playerTwo: "Jo-Wilfried Tsonga"),
                         Match(playerOne: "Tomas Berdych", playerTwo: "Gael Monfils")]

        matches.append(contentsOf: matchData)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMatches()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as? MatchTableViewCell else {
            fatalError()
        }

        let match = matches[indexPath.row]
        cell.configure(with: match)

        return cell
    }
}
