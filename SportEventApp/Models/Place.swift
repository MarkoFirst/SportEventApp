//
//  Place.swift
//  SportEventApp
//
//  Created by Ernest Asanov on 30.08.2023.
//

import Foundation
class Place {
    var address = ""
    var size: UInt = 0
    var peopleCount: UInt = 0
    var type: TypeSpot = .basketball
    var price = 0.0
    
    init(address: String = "", size: UInt = 0, peopleCount: UInt = 0, type: TypeSpot = .basketball, price: Double = 0.0) {
            self.address = address
            self.size = size
            self.peopleCount = peopleCount
            self.type = type
            self.price = price
        }
}
