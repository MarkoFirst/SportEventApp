//
//  Teams.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 07.09.2023.
//

import Foundation
import UIKit

// Creation of 2 instances of the "Team" class (basketball teams)

let chicagoBulls = Team(
    logo: "chicagobulls",
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
    logo: "lakers",
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

let celtics = Team(
    logo: "celtics",
    name: "Boston Celtics",
    players: [
        Athlete(firstName: "Jayson", lastName: "Tatum", age: 23, country: "United States", gender: .male),
        Athlete(firstName: "Jaylen", lastName: "Brown", age: 25, country: "United States", gender: .male),
        Athlete(firstName: "Al", lastName: "Horford", age: 35, country: "Dominican Republic", gender: .male),
        Athlete(firstName: "Marcus", lastName: "Smart", age: 27, country: "United States", gender: .male),
        Athlete(firstName: "Robert", lastName: "Williams", age: 24, country: "United States", gender: .male),
    ],
    coach: "Ime Udoka",
    teamFoundingDate: Date(),
    sport: basketball)

let warriors = Team(
    logo: "warriors",
    name: "Golden State Warriors",
    players: [
        Athlete(firstName: "Stephen", lastName: "Curry", age: 33, country: "United States", gender: .male),
        Athlete(firstName: "Klay", lastName: "Thompson", age: 32, country: "United States", gender: .male),
        Athlete(firstName: "Draymond", lastName: "Green", age: 31, country: "United States", gender: .male),
        Athlete(firstName: "Andrew", lastName: "Wiggins", age: 26, country: "Canada", gender: .male),
        Athlete(firstName: "Kevon", lastName: "Looney", age: 25, country: "United States", gender: .male),
    ],
    coach: "Steve Kerr",
    teamFoundingDate: Date(),
    sport: basketball)

let heat = Team(
    logo: "heat",
    name: "Miami Heat",
    players: [
        Athlete(firstName: "Jimmy", lastName: "Butler", age: 32, country: "United States", gender: .male),
        Athlete(firstName: "Bam", lastName: "Adebayo", age: 24, country: "United States", gender: .male),
        Athlete(firstName: "Kyle", lastName: "Lowry", age: 35, country: "United States", gender: .male),
        Athlete(firstName: "Duncan", lastName: "Robinson", age: 27, country: "United States", gender: .male),
        Athlete(firstName: "Tyler", lastName: "Herro", age: 21, country: "United States", gender: .male),
    ],
    coach: "Erik Spoelstra",
    teamFoundingDate: Date(),
    sport: basketball)

let nets = Team(
    logo: "nets",
    name: "Brooklyn Nets",
    players: [
        Athlete(firstName: "Kevin", lastName: "Durant", age: 33, country: "United States", gender: .male),
        Athlete(firstName: "James", lastName: "Harden", age: 32, country: "United States", gender: .male),
        Athlete(firstName: "Kyrie", lastName: "Irving", age: 29, country: "United States", gender: .male),
        Athlete(firstName: "Joe", lastName: "Harris", age: 30, country: "United States", gender: .male),
        Athlete(firstName: "DeAndre", lastName: "Jordan", age: 33, country: "United States", gender: .male),
    ],
    coach: "Steve Nash",
    teamFoundingDate: Date(),
    sport: basketball)

let sixers = Team(
    logo: "sixers",
    name: "Philadelphia 76ers",
    players: [
        Athlete(firstName: "Joel", lastName: "Embiid", age: 27, country: "Cameroon", gender: .male),
        Athlete(firstName: "Ben", lastName: "Simmons", age: 25, country: "Australia", gender: .male),
        Athlete(firstName: "Tobias", lastName: "Harris", age: 29, country: "United States", gender: .male),
        Athlete(firstName: "Seth", lastName: "Curry", age: 31, country: "United States", gender: .male),
        Athlete(firstName: "Andre", lastName: "Drummond", age: 28, country: "United States", gender: .male),
    ],
    coach: "Doc Rivers",
    teamFoundingDate: Date(),
    sport: basketball)

let bucks = Team(
    logo: "bucks",
    name: "Milwaukee Bucks",
    players: [
        Athlete(firstName: "Giannis", lastName: "Antetokounmpo", age: 27, country: "Greece", gender: .male),
        Athlete(firstName: "Khris", lastName: "Middleton", age: 30, country: "United States", gender: .male),
        Athlete(firstName: "Jrue", lastName: "Holiday", age: 31, country: "United States", gender: .male),
        Athlete(firstName: "Brook", lastName: "Lopez", age: 33, country: "United States", gender: .male),
        Athlete(firstName: "Donte", lastName: "DiVincenzo", age: 24, country: "United States", gender: .male),
    ],
    coach: "Mike Budenholzer",
    teamFoundingDate: Date(),
    sport: basketball)


extension UIViewController {

    func fetchTeamData() -> [Team] {

        let chicagoBulls = Team(
            logo: "chicagobulls",
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
            logo: "lakers",
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

        let celtics = Team(
            logo: "celtics",
            name: "Boston Celtics",
            players: [
                Athlete(firstName: "Jayson", lastName: "Tatum", age: 23, country: "United States", gender: .male),
                Athlete(firstName: "Jaylen", lastName: "Brown", age: 25, country: "United States", gender: .male),
                Athlete(firstName: "Al", lastName: "Horford", age: 35, country: "Dominican Republic", gender: .male),
                Athlete(firstName: "Marcus", lastName: "Smart", age: 27, country: "United States", gender: .male),
                Athlete(firstName: "Robert", lastName: "Williams", age: 24, country: "United States", gender: .male),
            ],
            coach: "Ime Udoka",
            teamFoundingDate: Date(),
            sport: basketball)

        let warriors = Team(
            logo: "warriors",
            name: "Golden State Warriors",
            players: [
                Athlete(firstName: "Stephen", lastName: "Curry", age: 33, country: "United States", gender: .male),
                Athlete(firstName: "Klay", lastName: "Thompson", age: 32, country: "United States", gender: .male),
                Athlete(firstName: "Draymond", lastName: "Green", age: 31, country: "United States", gender: .male),
                Athlete(firstName: "Andrew", lastName: "Wiggins", age: 26, country: "Canada", gender: .male),
                Athlete(firstName: "Kevon", lastName: "Looney", age: 25, country: "United States", gender: .male),
            ],
            coach: "Steve Kerr",
            teamFoundingDate: Date(),
            sport: basketball)

        let heat = Team(
            logo: "heat",
            name: "Miami Heat",
            players: [
                Athlete(firstName: "Jimmy", lastName: "Butler", age: 32, country: "United States", gender: .male),
                Athlete(firstName: "Bam", lastName: "Adebayo", age: 24, country: "United States", gender: .male),
                Athlete(firstName: "Kyle", lastName: "Lowry", age: 35, country: "United States", gender: .male),
                Athlete(firstName: "Duncan", lastName: "Robinson", age: 27, country: "United States", gender: .male),
                Athlete(firstName: "Tyler", lastName: "Herro", age: 21, country: "United States", gender: .male),
            ],
            coach: "Erik Spoelstra",
            teamFoundingDate: Date(),
            sport: basketball)

        let nets = Team(
            logo: "nets",
            name: "Brooklyn Nets",
            players: [
                Athlete(firstName: "Kevin", lastName: "Durant", age: 33, country: "United States", gender: .male),
                Athlete(firstName: "James", lastName: "Harden", age: 32, country: "United States", gender: .male),
                Athlete(firstName: "Kyrie", lastName: "Irving", age: 29, country: "United States", gender: .male),
                Athlete(firstName: "Joe", lastName: "Harris", age: 30, country: "United States", gender: .male),
                Athlete(firstName: "DeAndre", lastName: "Jordan", age: 33, country: "United States", gender: .male),
            ],
            coach: "Steve Nash",
            teamFoundingDate: Date(),
            sport: basketball)

        let sixers = Team(
            logo: "sixers",
            name: "Philadelphia 76ers",
            players: [
                Athlete(firstName: "Joel", lastName: "Embiid", age: 27, country: "Cameroon", gender: .male),
                Athlete(firstName: "Ben", lastName: "Simmons", age: 25, country: "Australia", gender: .male),
                Athlete(firstName: "Tobias", lastName: "Harris", age: 29, country: "United States", gender: .male),
                Athlete(firstName: "Seth", lastName: "Curry", age: 31, country: "United States", gender: .male),
                Athlete(firstName: "Andre", lastName: "Drummond", age: 28, country: "United States", gender: .male),
            ],
            coach: "Doc Rivers",
            teamFoundingDate: Date(),
            sport: basketball)

        let bucks = Team(
            logo: "bucks",
            name: "Milwaukee Bucks",
            players: [
                Athlete(firstName: "Giannis", lastName: "Antetokounmpo", age: 27, country: "Greece", gender: .male),
                Athlete(firstName: "Khris", lastName: "Middleton", age: 30, country: "United States", gender: .male),
                Athlete(firstName: "Jrue", lastName: "Holiday", age: 31, country: "United States", gender: .male),
                Athlete(firstName: "Brook", lastName: "Lopez", age: 33, country: "United States", gender: .male),
                Athlete(firstName: "Donte", lastName: "DiVincenzo", age: 24, country: "United States", gender: .male),
            ],
            coach: "Mike Budenholzer",
            teamFoundingDate: Date(),
            sport: basketball)

        return [chicagoBulls, lakers, celtics, warriors, heat, nets, sixers, bucks]
    }
}
