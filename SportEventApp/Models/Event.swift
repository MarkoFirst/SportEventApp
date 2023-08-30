//
//  Event.swift
//  SportEventApp
//
//  Created by Ernest Asanov on 30.08.2023.
//

import Foundation
class Event {
    var title = ""
    var description = ""
    var date = ""
    var place: Place
    var price = 0.0
    var tickets: UInt = 0
    var teams: [Team] = []
    
    init(title: String, description: String, date: String, place: Place, price: Double, tickets: UInt, teams: [Team]) {
            self.title = title
            self.description = description
            self.date = date
            self.place = place
            self.price = price
            self.tickets = tickets
            self.teams = teams
        }
}
