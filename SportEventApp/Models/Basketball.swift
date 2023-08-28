//
//  Basketball.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Basketball: TeamSport {
     init(teams: [Team]){
         super.init(teams: teams, name: "Basketball", maxPlayersCount: 12, typeOfSport: .basketball, typeOfEquipment: .basketball, minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium])
    }
}
