//
//  Usre.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class UserFav {
    let savedEvent: [Event]
    let favSport: [SportTypes]
    let favTeam: [Team]
    let favAthletes: [Athlete]
    
    init(savedEvent: [Event], favSport: [SportTypes], favTeam: [Team], favAthletes: [Athlete]) {
        self.savedEvent = savedEvent
        self.favSport = favSport
        self.favTeam = favTeam
        self.favAthletes = favAthletes
    }
}

