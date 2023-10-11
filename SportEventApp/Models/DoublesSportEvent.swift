//
//  DoublesSportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class DoublesSportEvent: SportEvent {
    @Persisted var athletes: List<Athlete>
    
    convenience init(title: String, desc: String, date: Date, place: Place?, currency: CurrencyList.RawValue, iconName: String, typeOfSport: TypeOfSport, athletes: List<Athlete>) {
        self.init(title: title, desc: desc, date: date, place: place, currency: currency, iconName: iconName, typeOfSport: typeOfSport)
        self.athletes = athletes
    }
}
