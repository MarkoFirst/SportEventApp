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
    
    var citizenship: CountryList
    var birthplace: CountryList
    var gender: GenderList
    var sport: TypeOfSport
    var number: UInt?
    var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    init(firstName: String, lastName: String, age: UInt, citizenship: CountryList, birthplace: CountryList, gender: GenderList, sport: TypeOfSport, number: UInt?, iconName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
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
