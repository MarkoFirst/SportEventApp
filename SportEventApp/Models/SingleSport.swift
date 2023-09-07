//
//  SingleSport.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit

class SingleSport: Sport {
    var athletes: [Athlete]
    
    init(athletes: [Athlete], name: String, maxPlayersCount: UInt, typeOfSport: TypeOfSport, typeOfEquipment: EquipmentList, minPlayersCount: UInt, reservePlayers: Bool, place: [PlacesType]) {
        self.athletes = athletes
        super.init(name: name, maxPlayersCount: 2, typeOfSport: typeOfSport, typeOfEquipment: typeOfEquipment, minPlayersCount: 2, reservePlayers: false, place: place)
    }
}
