//
//  Event.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation
import RealmSwift
import UIKit

class Event: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    var isFavorite: Bool = false
    var eventCoverName: String?
    var setEventCover: UIImage? {
        return UIImage(named: eventCoverName ?? "unknownCover") 
    }
    @Persisted var title: String = ""
    @Persisted var desc: String = ""
    @Persisted var date: Date?
    @Persisted var firstTeam: String = ""
    @Persisted var secondTeam: String = ""
//    var dateCompactString: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "E, MMM d"
//
//        return dateFormatter.string(from: date)
//    }
//    var dateFullString: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MMMM yyyy"
//
//        return dateFormatter.string(from: date)
//    }
//    let location: Place
//    var price: Double {
//        return location.ticketPrice
//    }
//    var tickets: [Ticket] {
//        return location.tickets
//    }
    
    convenience init(eventCoverName: String? = nil, title: String, description: String, date: Date, firstTeam: String, secondTeam: String) {
        self.init()
        self.eventCoverName = eventCoverName
        self.title = title
        self.date = date
        self.desc = description
        self.firstTeam = firstTeam
        self.secondTeam = secondTeam
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
    
//    func describeEvent() {
//        print("Title: \(title)")
//        print("Description: \(description)")
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let dateString = dateFormatter.string(from: date ?? Date())
//        print("Date: \(dateString)")
//        
//        print("Location: \(location.address)")
//        print("Price: \(price)")
//    }
}

