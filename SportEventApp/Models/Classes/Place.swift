//
//  Place.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Place {
    let nameOfPlace: String
    let numberOfSeatPlaces: Int
    let sport: SportTypes
    let city: String
    let adress: String
    let ticketPrice: String
    
    init(nameOfPlace: String, numberOfSeatPlaces: Int, sport: SportTypes, city: String, adress: String, price: String) {
        self.nameOfPlace = nameOfPlace
        self.numberOfSeatPlaces = numberOfSeatPlaces
        self.sport = sport
        self.city = city
        self.adress = adress
        self.ticketPrice = price
    }
}
