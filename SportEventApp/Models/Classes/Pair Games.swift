//
//  Pair Games.swift
//  SportEvent
//
//  Created by Дима Самойленко on 19.08.2023.
//

import Foundation

class PairGames: Athlete {
    let rank: String
    let sport: SportTypes
    init(rank: String, name: String, age: Int, gender: Gender, country: Country, sport: SportTypes) {
        self.rank = rank
        self.sport = sport
        super.init(name: name, age: age, number: 0, gender: gender, country: country)
    }
}

