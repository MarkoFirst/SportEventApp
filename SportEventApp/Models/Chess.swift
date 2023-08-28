//
//  Chess.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Chess: SingleSport {
    init(athletes: [Athlete]){
        super.init(athletes: athletes, name: "Chess", maxPlayersCount: 2, typeOfSport: .chess, typeOfEquipment: .chess, minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium, .casino, .internet, .nightClub, .theater])
   }
}
