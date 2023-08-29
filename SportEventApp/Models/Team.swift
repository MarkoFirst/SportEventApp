//
//  Team.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Team {
    var name: String
    var playersCount: Int
    var createYear: UInt
    var coach: String
    var sport: TypeOfSport
    var team: [Athlete]
    var country: CountryList
    
    init(name: String, createYear: UInt, coach: String, sport: TypeOfSport, team: [Athlete], country: CountryList){
        self.name = name
        self.playersCount = team.count
        self.createYear = createYear
        self.coach = coach
        self.sport = sport
        self.team = team
        self.country = country
    }
    
    func changeCoach(to newCoach: String) {
        self.coach = newCoach
    }
    
    func getAllAthlete() -> [String]{
        return team.enumerated().map( { "\($1.firstName) \($1.lastName)"})
        
    }
}
