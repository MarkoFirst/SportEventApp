//
//  Place.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Place {
    let address: String
    let capacity: UInt
    let suitableFor: [SportType]
    var ticketPrice: Double {
            didSet {
                updateTicketPrice()
            }
        }
    let tickets: [Ticket]
    
    init(address: String, capacity: UInt, suitableFor: [SportType], ticketPrice: Double, tickets: [Ticket]) {
        self.address = address
        self.capacity = capacity
        self.suitableFor = suitableFor
        self.ticketPrice = ticketPrice
        self.tickets = tickets
    }
    
    private func updateTicketPrice() {
            for index in 0..<tickets.count {
                tickets[index].price = ticketPrice
            }
        }
}

