//
//  FinishedEvent.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 06.09.2023.
//

import Foundation
import UIKit

class FinishedEvent: Event {
    let score: String
    init(title: String, description: String, date: String, place: Place, soldTickets: Int, teams: [Team]?, pairs: [PairGames]?, score: String) {
        self.score = score
        super.init(title: title, description: description, date: date, place: place, soldTickets: soldTickets, teams: teams, pairs: pairs)
    }
}
