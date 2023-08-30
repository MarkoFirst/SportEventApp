//
//  Team.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

class Team: Sport {
    var players: [String]
    var coach: String
    var replacementPlayer: String
    let teamName: String
    let dateCreate: UInt
    var equipment: String
    var numberOfSpectators : UInt
      
    init(players: [String],
         coach: String,
         replacementPlayer: String,
         teamName: String,
         dateCreate: UInt,
         equipment: TeamTypeSport,
         typeSport: TeamTypeSport,
         numberOfSpectators: UInt) {
        
        self.players = players
        self.coach = coach
        self.replacementPlayer = replacementPlayer
        self.teamName = teamName
        self.dateCreate = dateCreate
        self.equipment = equipment.equipment
        self.numberOfSpectators = numberOfSpectators
        
        
        super.init(typeSport: typeSport)
        
    }
}



