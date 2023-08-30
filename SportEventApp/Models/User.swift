//
//  User.swift
//  SportEventApp
//
//  Created by Ernest Asanov on 30.08.2023.
//

import Foundation
class User {
    var id: UInt = 0
    var username = ""
    var email = ""
    var password = ""
    var favEvent: Event
    var favSport: Sport
    var favTeam: Team
    var favAthlete: Athlete
    
    init(id: UInt = 0, username: String = "", email: String = "", password: String = "", favEvent: Event, favSport: Sport, favTeam: Team, favAthlete: Athlete) {
            self.id = id
            self.username = username
            self.email = email
            self.password = password
            self.favEvent = favEvent
            self.favSport = favSport
            self.favTeam = favTeam
            self.favAthlete = favAthlete
        }
}
