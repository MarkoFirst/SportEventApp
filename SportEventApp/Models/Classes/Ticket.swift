//
//  Ticket.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Ticket: Event {
    let seatNumber: Int
    var price: Int
    let stadiumZone: StadiumZone
    
    init(seatNumber: Int, price: Int, stadiumZone: StadiumZone, title: String, description: String, date: String, place: Place, soldTickets: Int) {
        self.seatNumber = seatNumber
        self.price = price
        self.stadiumZone = stadiumZone
        super.init(title: title, description: description, date: date, place: place, soldTickets: soldTickets)
    }
}

