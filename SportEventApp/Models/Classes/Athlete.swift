//
//  Athlete.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Athlete {
    var fullName: String
    var age: Int
    var number: Int
    var gender: Gender
    var country: Country
    
    init(name: String, age: Int, number: Int, gender: Gender, country: Country) {
        self.fullName = name
        self.age = age
        self.number = number
        self.gender = gender
        self.country = country
    }
}
