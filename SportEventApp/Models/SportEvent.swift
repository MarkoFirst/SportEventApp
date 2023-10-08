//
//  SportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class SportEvent: Event {
    var typeOfSport: TypeOfSport
    
    init(typeOfSport: TypeOfSport, title: String, description: String, date: Date, place: Place, currency: CurrencyList, iconName: String) {
        self.typeOfSport = typeOfSport
        super.init(title: title, description: description, date: date, place: place, currency: currency, iconName: iconName)
    }
}
