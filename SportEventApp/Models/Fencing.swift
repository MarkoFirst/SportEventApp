//
//  Fencing.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Fencing: SingleSport {
    init(athletes: [Athlete]){
        super.init(athletes: athletes, name: "Fencing", maxPlayersCount: 2, typeOfSport: .fencing, typeOfEquipment: .fencing, minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium, .nightClub, .theater])
   }
}
