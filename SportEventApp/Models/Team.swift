//
//  ClassExample.swift
//  SportEventApp
//
//  Created by MF-Citrus on 28.08.2023.
//

import Foundation

class Team {
    var athlete: Athlete
    var name = ""
    var dateCreated = ""
    var coach = ""
    var sport: Sport
    
    init(athlete: Athlete, sport: Sport) {
        self.athlete = athlete
        self.sport = sport
    }
    
}
