//
//  Team.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Team {
    let teamName: String
    let athletes: [Athlete]
    let dateCreate: String
    let coach: String
    let sport: SportTypes
    
    init(teamName: String, athletes: [Athlete], dateCreate: String, coach: String, sport: SportTypes) {
        self.teamName = teamName
        self.athletes = athletes
        self.dateCreate = dateCreate
        self.coach = coach
        self.sport = sport
    }
}
