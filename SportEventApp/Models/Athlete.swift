//
//  Athlete.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Athlete {
    var firstName: String
    var lastName: String
    var age: UInt
    
    var citizenship: CountryList
    var birthplace: CountryList
    var gender: GenderList
    var sport: TypeOfSport
    var number: UInt?
    
    init(firstName: String, lastName: String, age: UInt, citizenship: CountryList, birthplace: CountryList, gender: GenderList, sport: TypeOfSport, number: UInt?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.citizenship = citizenship
        self.birthplace = birthplace
        self.gender = gender
        self.sport = sport
        self.number = number
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
