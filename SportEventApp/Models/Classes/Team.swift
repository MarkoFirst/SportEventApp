//
//  Team.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation
import UIKit

class Team: Equatable {
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.teamName == rhs.teamName
    }
    
    
    var teamName: String
    var athletes: [Athlete]
    var dateCreate: String
    var coach: String
    var sport: SportTypes
    var teamLogo: UIImage
    
    init(teamName: String, athletes: [Athlete], dateCreate: String, coach: String, sport: SportTypes, teamLogo: UIImage) {
        self.teamName = teamName
        self.athletes = athletes
        self.dateCreate = dateCreate
        self.coach = coach
        self.sport = sport
        self.teamLogo = teamLogo
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
