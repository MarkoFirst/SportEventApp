//
//  Event.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class Event {
    var title: String
    var description: String
    var date: Date
    var place: Place
    var currency: CurrencyList
    var iconName: String
    var image: UIImage? {
        return UIImage(named: iconName)
    }
    
    init(title: String, description: String, date: Date, place: Place, currency: CurrencyList, iconName: String) {
        self.title = title
        self.description = description
        self.date = date
        self.place = place
        self.currency = currency
        self.iconName = iconName
    }
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM, dd, yy"
        return dateFormatter.string(from: self.date).description
    }
}
