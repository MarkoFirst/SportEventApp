//
//  SportEvent.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class SportEvent: Event {
    let teams: [Team]
    var sport: Sport
    
    init(title: String, description: String, date: Date, location: Place, tickets: [Ticket], sport: Sport, teams: [Team]) {
        self.sport = sport
        self.teams = teams
        super.init(title: title, description: description, date: date, location: location, tickets: tickets)
    }
    
    override func describeEvent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date = dateFormatter.string(from: date)
        let sportType: String
        
        switch sport.type {
        case .individual(let individualSport):
            sportType = "Sport type: \(individualSport.description)"
        case .team(let teamSport):
            sportType = "Sport type: \(teamSport.description)"
        case .individualteam(let individualTeamSport):
            sportType = "Sport type: \(individualTeamSport.description)"
        }
        
        print("Title: \(title)")
        print("Description: \(description)")
        
        print("Date: \(date)")
        
        print("Location: \(location.address)")
        print("Price: \(price)")
        
        print("Sport type: \(sportType)")
        print("Teams: \(teams.compactMap { team in team.name }.joined(separator: ", "))")
        print("Equipment: \(sport.equipment.map { equipment in equipment.rawValue }.joined(separator: ", "))")
    }
}

