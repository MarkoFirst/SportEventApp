//
//  SportEvent.swift
//  SportEvent
//
//  Created by Дима Самойленко on 19.08.2023.
//

import Foundation

class SportEvent: Event {
    let sportType: SportTypes

    init(sportType: SportTypes, title: String, description: String, date: String, place: Place, soldTickets: Int) {
        self.sportType = sportType
        super.init(title: title, description: description, date: date, place: place, soldTickets: soldTickets)
    }
}
