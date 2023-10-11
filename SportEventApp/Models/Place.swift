//
//  Place.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import RealmSwift

class Place: Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var type: PlacesType.RawValue
    @Persisted var contry: CountryList.RawValue
    @Persisted var maxSpectatorsCount: Int
    @Persisted var typeSport: List<String>
    @Persisted var priceFrom: Double
    @Persisted var priceTo: Double
    @Persisted var currency: CurrencyList.RawValue
    @Persisted var adress: String
    
    convenience init(name: String, type: PlacesType, contry: CountryList, maxSpectatorsCount: Int, typeSport: [String], priceFrom: Double, priceTo: Double, currency: CurrencyList, adress: String){
        self.init()
        self.name = name
        self.type = type.rawValue
        self.contry = contry.rawValue
        self.maxSpectatorsCount = maxSpectatorsCount
        self.typeSport.append(objectsIn: typeSport)
        self.priceFrom = priceFrom
        self.priceTo = priceTo
        self.currency = currency.rawValue
        self.adress = adress
    }
    
    func addTypeSport(_ newTypeSport: TypeOfSport.RawValue){
        typeSport.append(newTypeSport)
    }
}
