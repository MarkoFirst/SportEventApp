//
//  Athlet.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation


class Athlete {
    let playerName: String
    let age: UInt
    let gender : String
    let country : String
    var skillLevel: Int
    var isPlaying: Bool
    
    init(playerName: String, skillLevel: Int, age: UInt, gender: String, country: String) {
        self.playerName = playerName
        self.skillLevel = skillLevel
        self.isPlaying = false
        self.age = age
        self.gender = gender
        self.country = country
    }
    
    func joinGame() {
        isPlaying = true
        print("\(playerName)  играет сегодня")
    }
    
    func leaveGame() {
        isPlaying = false
        print("\(playerName) не играет сегодня")
    }
}

