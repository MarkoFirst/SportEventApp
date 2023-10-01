//
//  Athlete.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class Athlete: Participant {
    var firstName: String
    var lastName: String
    var age: UInt
    var typeOfSport: TypeOfSport
    var gamesValue: UInt
    var goalsValue: UInt?
    var athleteTeam: Team?
    var atheleBigImageName: String
    var atheleBigImage: UIImage {
        return UIImage(named: atheleBigImageName) ?? UIImage()
    }
    var athleteRole: String?
    var allKicks: UInt
    var shotOnTarget: UInt?
    var goalsScored: UInt?
    var foulsWon: UInt?
    var foulsConceded: UInt?
    var redCards: UInt?
    var yellowCards: UInt?
    var trophies: [Trophy]?
    var teams: [AthleteTeams]?
    var citizenship: CountryList
    var birthplace: CountryList
    var gender: GenderList
    var sport: TypeOfSport
    var number: UInt?
    var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    init(firstName: String, lastName: String, age: UInt, typeOfSport: TypeOfSport, gamesValue: UInt, goalsValue: UInt?, athleteTeam: Team?, atheleBigImageName: String, athleteRole: String?, allKicks: UInt, shotOnTarget: UInt?, goalsScored: UInt?, foulsWon: UInt?, foulsConceded: UInt?, redCards: UInt?, yellowCards: UInt?, trophies: [Trophy]?, teams: [AthleteTeams]?, citizenship: CountryList, birthplace: CountryList, gender: GenderList, sport: TypeOfSport, number: UInt?, iconName: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.typeOfSport = typeOfSport
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
        self.trophies = trophies
        self.teams = teams
        self.citizenship = citizenship
        self.birthplace = birthplace
        self.gender = gender
        self.sport = sport
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
        self.citizenship = newCitizenship
    }
    
    func changeNumber(to newNumber: UInt) {
        self.number = newNumber
    }
}
