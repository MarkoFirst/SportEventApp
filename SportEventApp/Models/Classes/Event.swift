//
//  Event.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Event: Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.title == rhs.title
    }
    
    
    var title: String
    var description: String
    var date: String
    var place: Place
    var soldTickets: Int
    var teams: [Team]?
    var pairs: [PairGames]?
    
    init(title: String, description: String, date: String, place: Place, soldTickets: Int, teams: [Team]?, pairs: [PairGames]?) {
        self.title = title
        self.description = description
        self.date = date
        self.place = place
        self.soldTickets = soldTickets
        self.teams = teams
        self.pairs = pairs
    }
    
    func changeTitle(element: String) {
        title = element
    }
    
    func changeDescription(element: String) {
        description = element
    }
    
    func changeDate(element: String) {
        date = element
    }
    
    func changePlace(element: Place) {
        place = element
    }
    
    func changeNumberOfSoldTickets(element: Int) {
        soldTickets = element
    }
    
}
