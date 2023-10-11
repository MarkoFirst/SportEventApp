//
//  Ticket.swift
//  SportEvents
//
//  Created by Dima Kahanets on 21.08.2023.
//

import Foundation

class Ticket {
    let id: Int
    var isSold: Bool
    var isValid: Bool
    var price: Double
    
    init(id: Int, price: Double) {
        self.id = id
        self.isSold = false
        self.isValid = true
        self.price = price
    }
    
    static func createTickets(count: Int, price: Double) -> [Ticket] {
        var tickets: [Ticket] = []
        
        for item in 1...count {
            tickets.append(Ticket(id: item, price: price))
        }
        
        return tickets
    }
}


let lakersVsBullsTickets = Ticket.createTickets(count: 500, price: 50.0)
