//
//  Team.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Team: Favoritable {
    var isFavorite: Bool = false
    let logo: String
    let name: String?
    let players: [Athlete]
    let coach: String
    let teamFoundingDate: Date
    let sport: Sport
    
    init(logo: String, name: String? = nil, players: [Athlete] , coach: String, teamFoundingDate: Date, sport: Sport) {
        self.logo = logo
        self.name = name
        self.players = players
        self.coach = coach
        self.teamFoundingDate = teamFoundingDate
        self.sport = sport
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}

