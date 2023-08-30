//
//  Athlete.swift
//  SportEventApp
//
//  Created by Ernest Asanov on 30.08.2023.
//

import Foundation
class Athlete {
    var name = ""
    var age: UInt = 0
    var number: UInt = 0
    var gender: Gender = .male
    var country: Country = .UA
    
    init(name: String, age: UInt, number: UInt, gender: Gender, country: Country) {
            self.name = name
            self.age = age
            self.number = number
            self.gender = gender
            self.country = country
        }
}
