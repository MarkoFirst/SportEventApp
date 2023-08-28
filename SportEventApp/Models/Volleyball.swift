//
//  Volleyball.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Volleyball: TeamSport {
     init(teams: [Team]){
         super.init(teams: teams, name: "Volleyball", maxPlayersCount: 12, typeOfSport: .volleyball, typeOfEquipment: .volleyball, minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium, .beach])
    }
}
