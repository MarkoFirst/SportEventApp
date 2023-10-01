//
//  Team.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class Team: Participant {
    var name: String
    var playersCount: Int
    var createYear: UInt
    var coach: String
    var sport: TypeOfSport
    var team: [Athlete]?
    var country: CountryList
    var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    
    init(name: String, createYear: UInt, coach: String, sport: TypeOfSport, team: [Athlete]?, country: CountryList, iconName: String){
        self.name = name
        self.playersCount = team?.count ?? 0
        self.createYear = createYear
        self.coach = coach
        self.sport = sport
        self.team = team
        self.country = country
        self.iconName = iconName
    }
    
    func changeCoach(to newCoach: String) {
        self.coach = newCoach
    }
    
    func getAllAthlete() -> [String]{
        return team?.enumerated().map( { "\($1.firstName) \($1.lastName)"}) ?? [""]
        
    }
}
