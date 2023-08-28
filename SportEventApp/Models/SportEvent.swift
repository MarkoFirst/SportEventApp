//
//  SportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class SportEvent: Event {
    var typeOfSport: TypeOfSport
    
    init(typeOfSport: TypeOfSport, title: String, description: String, date: String, place: Place, currency: CurrencyList) {
        self.typeOfSport = typeOfSport
        super.init(title: title, description: description, date: date, place: place, currency: currency)
    }
}
