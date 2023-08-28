//
//  TeamSport.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class TeamSport: Sport {
    var teams: [Team]
    
    init(teams: [Team], name: String, maxPlayersCount: UInt, typeOfSport: TypeOfSport, typeOfEquipment: EquipmentList, minPlayersCount: UInt, reservePlayers: Bool, place: [PlacesType]) {
        self.teams = teams
        super.init(name: name, maxPlayersCount: maxPlayersCount, typeOfSport: typeOfSport, typeOfEquipment: typeOfEquipment, minPlayersCount: 2, reservePlayers: reservePlayers, place: place)
    }
}
