//
//  OfflinePlace.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class OfflinePlace: Place {
    var adress: String
    var size: UInt
    
    init(adress: String, size: UInt, name: String, type: PlacesType, contry: CountryList, maxSpectatorsCount: UInt, typeSport: [TypeOfSport], priceFrom: Double, priceTo: Double, currency: CurrencyList) {
        self.adress = adress
        self.size = size
        super.init(name: name, type: type, contry: contry, maxSpectatorsCount: maxSpectatorsCount, typeSport: typeSport, priceFrom: priceFrom, priceTo: priceTo, currency: currency)
    }
}
