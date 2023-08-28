//
//  Football.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Football: TeamSport {
     init(teams: [Team]){
         super.init(teams: teams, name: "Football", maxPlayersCount: 22, typeOfSport: .football, typeOfEquipment: .football, minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium, .beach])
    }
}
