//
//  Team.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Team: Favoritable {
    var isFavorite: Bool = false
    let name: String?
    let players: [Athlete]
    let coach: String
    let teamFoundingDate: Date
    let sport: Sport
    
    init(name: String? = nil, players: [Athlete] , coach: String, teamFoundingDate: Date, sport: Sport) {
        self.name = name
        self.players = players
        self.coach = coach
        self.teamFoundingDate = teamFoundingDate
        self.sport = sport
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}

// Creation of 2 instances of the "Team" class (basketball teams)

let chicagoBulls = Team(
    name: "Chicago Bulls",
    players: [
        Athlete(firstName: "Michael", lastName: "Jordan", age: 58, country: "United States", gender: .male),
        Athlete(firstName: "Scottie", lastName: "Pippen", age: 56, country: "United States", gender: .male),
        Athlete(firstName: "Dennis", lastName: "Rodman", age: 60, country: "United States", gender: .male),
        Athlete(firstName: "Derrick", lastName: "Rose", age: 32, country: "United States", gender: .male),
        Athlete(firstName: "Luol", lastName: "Deng", age: 36, country: "South Sudan", gender: .male),
    ],
    coach: "Billy Donovan",
    teamFoundingDate: Date(),
    sport: basketball)

let lakers = Team(
    name: "Los Angeles Lakers",
    players: [
        Athlete(firstName: "LeBron", lastName: "James", age: 37, country: "United States", gender: .male),
        Athlete(firstName: "Anthony", lastName: "Davis", age: 29, country: "United States", gender: .male),
        Athlete(firstName: "Russell", lastName: "Westbrook", age: 33, country: "United States", gender: .male),
        Athlete(firstName: "Carmelo", lastName: "Anthony", age: 38, country: "United States", gender: .male),
        Athlete(firstName: "Dwight", lastName: "Howard", age: 35, country: "United States", gender: .male),
    ],
    coach: "Frank Vogel",
    teamFoundingDate: Date(),
    sport: basketball)

// Creation of 2 instances of the "Team" class (tennis teams)

let nadalAcademy = Team(
    name: "Rafael Nadal Tennis Academy",
    players: [
        Athlete(firstName: "Rafael", lastName: "Nadal", age: 35, country: "Spain", gender: .male),
        Athlete(firstName: "Maria", lastName: "Sharapova", age: 34, country: "Russia", gender: .female),
        Athlete(firstName: "Carlos", lastName: "Moya", age: 45, country: "Spain", gender: .male),
        Athlete(firstName: "Garbiñe", lastName: "Muguruza", age: 28, country: "Spain", gender: .female),
    ],
    coach: "Rafael Nadal",
    teamFoundingDate: Date(),
    sport: tennis
)

let williamsTeam = Team(
    name: "Williams Tennis Team",
    players: [
        Athlete(firstName: "Serena", lastName: "Williams", age: 39, country: "United States", gender: .female),
        Athlete(firstName: "Venus", lastName: "Williams", age: 41, country: "United States", gender: .female),
        Athlete(firstName: "Patrick", lastName: "Mouratoglou", age: 51, country: "France", gender: .male),
        Athlete(firstName: "Coco", lastName: "Gauff", age: 17, country: "United States", gender: .female),
    ],
    coach: "Patrick Mouratoglou",
    teamFoundingDate: Date(),
    sport: tennis
)

// Creation of 2 instances of the "Team" class (chess teams)

let chessPros = Team(
    players: [
        Athlete(firstName: "Fabiano", lastName: "Caruana", age: 29, country: "United States", gender: .male),
    ],
    coach: "Viswanathan Anand",
    teamFoundingDate: Date(),
    sport: chess
)

let grandmastersUnited = Team(
    players: [
        Athlete(firstName: "Levon", lastName: "Aronian", age: 39, country: "Armenia", gender: .male),
    ],
    coach: "Judit Polgar",
    teamFoundingDate: Date(),
    sport: chess
)



