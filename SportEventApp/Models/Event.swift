//
//  Event.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class Event: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var desc: String = ""
    @Persisted var date: Date = Date()
    @Persisted var place: Place?
    @Persisted var currency: CurrencyList.RawValue = ""
    @Persisted var icon: Data?
    
    convenience init(title: String, desc: String, date: Date, place: Place?, currency: CurrencyList.RawValue, icon: Data, typeOfSport: TypeOfSport.RawValue) {
        self.init()
        self.title = title
        self.desc = desc
        self.date = date
        self.place = place
        self.currency = currency
        self.icon = icon
    }
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM, dd, yy"
        return dateFormatter.string(from: self.date).description
    }
}
