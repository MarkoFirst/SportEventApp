//
//  Poker.swift
//  SportEvent
//
//  Created by Дима Самойленко on 19.08.2023.
//

import Foundation
import UIKit

class Poker: PairGames {
    override init(rank: String, name: String, age: Int, gender: Gender, country: Country, sport: SportTypes) {
        super.init(rank: rank, name: name, age: age, gender: gender, country: country, sport: .poker)
    }
}
