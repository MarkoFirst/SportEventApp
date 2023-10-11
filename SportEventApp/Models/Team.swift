//
//  Team.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class Team: Participant {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var playersCount: Int
    @Persisted var createYear: Int
    @Persisted var coach: String
    @Persisted var sport: TypeOfSport.RawValue
    @Persisted var team: List<Athlete>
    @Persisted var country: CountryList.RawValue
    @Persisted var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    convenience init(name: String, createYear: Int, coach: String, sport: TypeOfSport, team: [Athlete]?, country: CountryList, iconName: String){
        self.init()
        self.id = name + createYear.description
        self.name = name
        self.playersCount = team?.count ?? 0
        self.createYear = createYear
        self.coach = coach
        self.sport = sport.rawValue
        self.team.append(objectsIn: team ?? [])
        self.country = country.rawValue
        self.iconName = iconName
    }
    
    func changeCoach(to newCoach: String) {
        self.coach = newCoach
    }
    
    func getAllAthlete() -> [String]{
        return team.enumerated().map( { "\($1.firstName) \($1.lastName)"}) 
        
    }
}
