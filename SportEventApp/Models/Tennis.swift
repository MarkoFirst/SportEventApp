//
//  Tennis.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Tennis: SingleSport {
    init(athletes: [Athlete]){
        super.init(athletes: athletes, name: "Tennis", maxPlayersCount: 2, typeOfSport: .tennis, typeOfEquipment: .tennis, minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium])
   }
}
