//
//  Poker.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Poker: SingleSport {
    init(athletes: [Athlete]){
        super.init(athletes: athletes, name: "Poker", maxPlayersCount: 10, typeOfSport: .poker, typeOfEquipment: .poker, minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .stadium, .nightClub, .theater, .computerСlub, .casino, .internet])
   }
}
