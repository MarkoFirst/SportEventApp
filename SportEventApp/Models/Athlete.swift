//
//  Athlete.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class Athlete: Participant {
    @Persisted(primaryKey: true) var id: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var age: Int
    @Persisted var typeOfSport: TypeOfSport.RawValue
    @Persisted var gamesValue: Int
    @Persisted var goalsValue: Int?
    @Persisted var athleteTeam: Team?
    @Persisted var atheleBigImageName: String
    var atheleBigImage: UIImage {
        return UIImage(named: atheleBigImageName) ?? UIImage()
    }
    @Persisted var athleteRole: String?
    @Persisted var allKicks: Int
    @Persisted var shotOnTarget: Int?
    @Persisted var goalsScored: Int?
    @Persisted var foulsWon: Int?
    @Persisted var foulsConceded: Int?
    @Persisted var redCards: Int?
    @Persisted var yellowCards: Int?
    @Persisted var trophies: List<Trophy>
    @Persisted var teams: List<AthleteTeams>
    @Persisted var citizenship: CountryList.RawValue
    @Persisted var birthplace: CountryList.RawValue
    @Persisted var gender: GenderList.RawValue
    @Persisted var sport: TypeOfSport.RawValue
    @Persisted var number: Int?
    @Persisted var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    convenience init(firstName: String, lastName: String, age: Int, typeOfSport: TypeOfSport, gamesValue: Int, goalsValue: Int?, athleteTeam: Team?, atheleBigImageName: String, athleteRole: String?, allKicks: Int, shotOnTarget: Int?, goalsScored: Int?, foulsWon: Int?, foulsConceded: Int?, redCards: Int?, yellowCards: Int?, trophies: [Trophy]?, teams: [AthleteTeams]?, citizenship: CountryList, birthplace: CountryList, gender: GenderList, sport: TypeOfSport, number: Int?, iconName: String) {
        self.init()
        self.id = firstName + lastName + age.description
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.typeOfSport = typeOfSport.rawValue
        self.gamesValue = gamesValue
        self.goalsValue = goalsValue ?? 0
        self.athleteTeam = athleteTeam
        self.atheleBigImageName = atheleBigImageName
        self.athleteRole = athleteRole
        self.allKicks = allKicks
        self.shotOnTarget = shotOnTarget ?? 0
        self.goalsScored = goalsScored ?? 0
        self.foulsWon = foulsWon ?? 0
        self.foulsConceded = foulsConceded ?? 0
        self.redCards = redCards ?? 0
        self.yellowCards = yellowCards ?? 0
        self.trophies.append(objectsIn: trophies ?? [])
        self.teams.append(objectsIn: teams ?? [])
        self.citizenship = citizenship.rawValue
        self.birthplace = birthplace.rawValue
        self.gender = gender.rawValue
        self.sport = sport.rawValue
        self.number = number
        self.iconName = iconName
    }
    
    func changeFirstName(to newName: String) {
        self.firstName = newName
    }
    
    func changeLastName(to newLastName: String) {
        self.lastName = newLastName
    }
    
    func changeСitizenship(to newCitizenship: CountryList) {
        self.citizenship = newCitizenship.rawValue
    }
    
    func changeNumber(to newNumber: Int) {
        self.number = newNumber
    }
}
