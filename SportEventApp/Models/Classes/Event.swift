//
//  Event.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Event {
    let title: String
    var description: String
    var date: String
    var place: Place
    var soldTickets: Int
    
    init(title: String, description: String, date: String, place: Place, soldTickets: Int) {
        self.title = title
        self.description = description
        self.date = date
        self.place = place
        self.soldTickets = soldTickets
    }
}
