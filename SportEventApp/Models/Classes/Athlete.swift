//
//  Athlete.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Athlete: Equatable {

    var fullName: String
    var age: Int
    var number: Int
    var gender: Gender
    var country: Country
    
    static func == (lhs: Athlete, rhs: Athlete) -> Bool {
        return lhs.fullName == rhs.fullName
    }
    
    init(name: String, age: Int, number: Int, gender: Gender, country: Country) {
        self.fullName = name
        self.age = age
        self.number = number
        self.gender = gender
        self.country = country
    }
    
    func changeFullName(element: String) {
        fullName = element
    }
    
    func changeAge(element: Int) {
        age = element
    }
    
    func changeNumber(element: Int) {
        number = element
    }
    
    func changeGender(element: Gender) {
        gender = element
    }
    
    func changeCountry(element: Country) {
        country = element
    }
    
}
