//
//  OnlinePlace.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class OnlinePlace: Place {
    var urlAdress: String
    var language: [Language]
    
    init(urlAdress: String, language: [Language], name: String, type: PlacesType, contry: CountryList, maxSpectatorsCount: UInt, typeSport: [TypeOfSport], priceFrom: Double, priceTo: Double, currency: CurrencyList) {
        self.urlAdress = urlAdress
        self.language = language
        super.init(name: name, type: type, contry: contry, maxSpectatorsCount: maxSpectatorsCount, typeSport: typeSport, priceFrom: priceFrom, priceTo: priceTo, currency: currency)
    }
    
    func addLanguage(newLanguage: Language){
        self.language.append(newLanguage)
    }
}

protocol OnlineEvent {
    func updateLink (to newLink: String) -> String
}

extension OnlinePlace: OnlineEvent {
    func updateLink (to newLink: String) -> String {
        self.urlAdress = newLink
        return newLink
    }
}
