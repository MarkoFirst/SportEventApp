//
//  PingPong.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class PingPong: SingleSport {
    init(athletes: [Athlete]){
        super.init(athletes: athletes, name: "Ping-Pong", maxPlayersCount: 2, typeOfSport: .pingpong, typeOfEquipment: .pingpong, minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium])
   }
}
