//
//  Athlete.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation
import UIKit

class Athlete: Favoritable {
    var isFavorite: Bool = false
    let firstName: String
    let lastName: String
    var setFullName: String {
        return "\(firstName) \(lastName)"
    }
    let age: UInt
    let country: String
    let gender: Gender
    var athleteImageName: String?
    var setAthleteImage: UIImage? {
        return UIImage(named: athleteImageName ?? "unknownCover")
    }
    var goals: UInt?
    var games: UInt?
    
    init(firstName: String, lastName: String, age: UInt, country: String, gender: Gender, athleteImageName: String? = nil, goals: UInt? = nil, games: UInt? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.country = country
        self.gender = gender
        self.athleteImageName = athleteImageName
        self.goals = goals
        self.games = games
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}
