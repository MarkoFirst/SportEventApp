//
//  Football.swift
//  SportEvent
//
//  Created by Дима Самойленко on 19.08.2023.
//

import Foundation
class Football: Team {
    override init(teamName: String, athletes: [Athlete], dateCreate: String, coach: String, sport: SportTypes) {
        super.init(teamName: teamName, athletes: athletes, dateCreate: dateCreate, coach: coach, sport: .football)
    }
}
