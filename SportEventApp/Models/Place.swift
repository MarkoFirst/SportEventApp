//
//  Place.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

class Place: Event {
    let placeName: String
    let address: String
    let priceTicket: UInt
    let peopleCount: UInt
    
    init(eventName: String,
         date: String,
         location: String,
         type: EventType,
         placeName: String,
         address: String,
         priceTicket: UInt,
         peopleCount: UInt,
         typeSport: TeamTypeSport) {
        
        self.placeName = placeName
        self.address = address
        self.priceTicket = priceTicket
        self.peopleCount = peopleCount
        
        super.init(eventName: eventName, date: date, location: location, type:type, typeSport: typeSport)
    }
}

