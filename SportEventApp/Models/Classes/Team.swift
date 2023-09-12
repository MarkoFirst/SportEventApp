//
//  Team.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Team: Equatable {
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.teamName == rhs.teamName
    }
    
    
    var teamName: String
    var athletes: [Athlete]
    var dateCreate: String
    var coach: String
    var sport: SportTypes
    
    init(teamName: String, athletes: [Athlete], dateCreate: String, coach: String, sport: SportTypes) {
        self.teamName = teamName
        self.athletes = athletes
        self.dateCreate = dateCreate
        self.coach = coach
        self.sport = sport
    }
    
    func changeTeamName(element: String) {
        teamName = element
    }
    
    func addAthleteToTeam(element: Athlete) {
        athletes.append(element)
    }
    
    func removeAthleteFromTeam(element: Athlete) {
        if let index = athletes.firstIndex(of: element) {
            athletes.remove(at: index)
        }
    }
    
    func changeDateCreate(element: String) {
        dateCreate = element
    }
    
    func changCoach(element: String) {
        coach = element
    }
    
    func changeSportTypes(element: SportTypes) {
        sport = element
    }
    
}
