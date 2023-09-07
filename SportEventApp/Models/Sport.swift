//
//  Sport.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class Sport {
    var name: String
    var maxPlayersCount: UInt
    var typeOfSport: TypeOfSport
    var typeOfEquipment: EquipmentList
    var minPlayersCount: UInt
    var reservePlayers: Bool
    var place: [PlacesType]
    
    init(name: String, maxPlayersCount: UInt, typeOfSport: TypeOfSport, typeOfEquipment: EquipmentList, minPlayersCount: UInt, reservePlayers: Bool, place: [PlacesType]) {
        self.name = name
        self.maxPlayersCount = maxPlayersCount
        self.typeOfSport = typeOfSport
        self.typeOfEquipment = typeOfEquipment
        self.minPlayersCount = minPlayersCount
        self.reservePlayers = reservePlayers
        self.place = place
    }
}
