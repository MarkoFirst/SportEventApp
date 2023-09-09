//
//  Athlete.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Athlete: Favoritable {
    var isFavorite: Bool = false
    let firstName: String
    let lastName: String
    let age: UInt
    let country: String
    let gender: Gender
    //    let team: Team?
    
    init(firstName: String, lastName: String, age: UInt, country: String, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.country = country
        self.gender = gender
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}
