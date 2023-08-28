//
//  DoublesSportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class DoublesSportEvent: SportEvent {
    var athletes: [Athlete]
    
    init(athletes: [Athlete], typeOfSport: TypeOfSport, title: String, description: String, date: String, place: Place, currency: CurrencyList) {
        self.athletes = athletes
        super.init(typeOfSport: typeOfSport, title: title, description: description, date: date, place: place, currency: currency)
    }
}
