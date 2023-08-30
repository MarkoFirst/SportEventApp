//
//  Event.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Event: Favoritable {
    var isFavorite: Bool = false
    let title: String
    let description: String
    let date: Date
    let location: Place
    var price: Double {
        return location.ticketPrice
    }
    var tickets: [Ticket] {
        return location.tickets
    }
    
    init(title: String, description: String, date: Date, location: Place, tickets: [Ticket]) {
        self.title = title
        self.date = date
        self.description = description
        self.location = location
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
    
    func describeEvent() {
        print("Title: \(title)")
        print("Description: \(description)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        print("Date: \(dateString)")
        
        print("Location: \(location.address)")
        print("Price: \(price)")
    }
}

