//
//  Place.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class Place {
    var nameOfPlace: String
    var numberOfSeatPlaces: Int
    var sport: SportTypes
    var country: Country
    var city: String
    var adress: String
    var ticketPrice: String
    
    init(nameOfPlace: String, numberOfSeatPlaces: Int, sport: SportTypes, country: Country, city: String, adress: String, price: String) {
        self.nameOfPlace = nameOfPlace
        self.numberOfSeatPlaces = numberOfSeatPlaces
        self.sport = sport
        self.country = country
        self.city = city
        self.adress = adress
        self.ticketPrice = price
    }
    
    func changeNameOfPlace(element: String) {
        nameOfPlace = element
    }
    
    func changeNumberOfSeatPlaces(element: Int) {
        numberOfSeatPlaces = element
    }
    
    func changeSport(element: SportTypes) {
        sport = element
    }
    
    func changeCity(element: String) {
        city = element
    }
    
    func changeAdress(element: String) {
        adress = element
    }
    
    func changeTicketPrice(element: String) {
        ticketPrice = element
    }
    
    func changeCountry(element: Country) {
        country = element
    }
    
}
