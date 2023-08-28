//
//  Event.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Event {
    var title: String
    var description: String
    var date: String
    var place: Place
    var currency: CurrencyList
    
    init(title: String, description: String, date: String, place: Place, currency: CurrencyList) {
        self.title = title
        self.description = description
        self.date = date
        self.place = place
        self.currency = currency
    }
}
