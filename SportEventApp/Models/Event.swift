//
//  Event.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation
import UIKit

class Event: Favoritable {
    var isFavorite: Bool = false
    var eventCoverName: String?
    var setEventCover: UIImage? {
        return UIImage(named: eventCoverName ?? "unknownCover") 
    }
    let title: String
    let description: String
    let date: Date
    var dateCompactString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d"
        
        return dateFormatter.string(from: date)
    }
    var dateFullString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    let location: Place
    var price: Double {
        return location.ticketPrice
    }
    var tickets: [Ticket] {
        return location.tickets
    }
    
    init(eventCoverName: String? = nil, title: String, description: String, date: Date, location: Place, tickets: [Ticket]) {
        self.eventCoverName = eventCoverName
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

