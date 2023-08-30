//
//  Event.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation


class Event: Sport {
    var eventName: String
    var date: String
    var location: String
    let type: String
   
    init(eventName: String, date: String, location: String, type: EventType, typeSport: TeamTypeSport) {
        self.eventName = eventName
        self.date = date
        self.location = location
        self.type = type.descriptions
        
        super.init(typeSport: typeSport)
       
    }
    
}
