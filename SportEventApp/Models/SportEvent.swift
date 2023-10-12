//
//  SportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class SportEvent: Event {
    @Persisted var typeOfSport: TypeOfSport.RawValue = ""
    
    convenience init(title: String, desc: String, date: Date, place: Place?, currency: CurrencyList.RawValue, icon: Data, typeOfSport: TypeOfSport) {
        self.init()
        self.typeOfSport = typeOfSport.rawValue
    }
}
