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

// Creation of 2 instances of the "Place" class

let staplesCenter = Place(
    address: "1111 S Figueroa St, Los Angeles, CA 90015, United States",
    capacity: 19000,
    suitableFor: [.team(.basketball)],
    ticketPrice: 50.0,
    tickets: lakersVsBullsTickets
)

let unitedCenter = Place(
    address: "1901 W Madison St, Chicago, IL 60612, United States",
    capacity: 23500,
    suitableFor: [.team(.basketball)],
    ticketPrice: 40.0,
    tickets: lakersVsBullsTickets
)
