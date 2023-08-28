//
//  Place.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Place {
    var name: String
    var type: PlacesType
    var contry: CountryList
    var maxSpectatorsCount: UInt
    var typeSport: [TypeOfSport]
    var priceFrom: Double
    var priceTo: Double
    var currency: CurrencyList
    
    init(name: String, type: PlacesType, contry: CountryList, maxSpectatorsCount: UInt, typeSport: [TypeOfSport], priceFrom: Double, priceTo: Double, currency: CurrencyList){
        self.name = name
        self.type = type
        self.contry = contry
        self.maxSpectatorsCount = maxSpectatorsCount
        self.typeSport = typeSport
        self.priceFrom = priceFrom
        self.priceTo = priceTo
        self.currency = currency
    }
    
    func addTypeSport(_ newTypeSport: TypeOfSport){
        typeSport.append(newTypeSport)
    }
}
