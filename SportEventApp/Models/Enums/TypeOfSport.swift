//
//  TypeOfSport.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

enum TypeOfSport: String {
    case football = "Football"
    case basketball = "Basketball"
    case volleyball = "Volleyball"
    case tennis = "Tennis"
    case pingpong = "Ping-pong"
    case chess = "Chess"
    case poker = "Poker"
    case fencing = "Fencing"
    case cybersport = "Cybersport"
    
    var info: (maxPlayersCount: Int, typeOfEquipment: String, minPlayersCount: Int, reservePlayers: Bool, place: [PlacesType]) {
        
        switch self {
        case .football:
            return (maxPlayersCount: 22, typeOfEquipment: "Soccer ball", minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium, .beach])
        case .basketball:
            return (maxPlayersCount: 12, typeOfEquipment: "Basketball ball", minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium])
        case .volleyball:
            return (maxPlayersCount: 12, typeOfEquipment: "Volleyball ball", minPlayersCount: 2, reservePlayers: true, place: [.sportsHall, .sportsPark, .street, .stadium, .beach])
        case .tennis:
            return (maxPlayersCount: 2, typeOfEquipment: "Tennis racquet", minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium])
        case .pingpong:
            return (maxPlayersCount: 2, typeOfEquipment: "Ping-pong racquet", minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium])
        case .chess:
            return (maxPlayersCount: 2, typeOfEquipment: "Chess board", minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium, .casino, .internet, .nightClub, .theater])
        case .poker:
            return (maxPlayersCount: 10, typeOfEquipment: "Cards", minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .stadium, .nightClub, .theater, .computerСlub, .casino, .internet])
        case .fencing:
            return (maxPlayersCount: 2, typeOfEquipment: "Sword", minPlayersCount: 2, reservePlayers: false, place: [.sportsHall, .sportsPark, .street, .stadium, .nightClub, .theater])
        case .cybersport:
            return (maxPlayersCount: 100, typeOfEquipment: "PC, internet", minPlayersCount: 1, reservePlayers: false, place: [.sportsHall, .stadium, .nightClub, .theater, .computerСlub, .internet])
        }
    }
    
    static var allCases: [TypeOfSport] {
        return [.football, .basketball, .volleyball, .tennis, .pingpong, .chess, .poker, .fencing, .cybersport]
    }
    
    static var allImages: [String] {
        return ["footballIcon", "basketballIcon", "volleyballIcon", "tennisIcon", "pingpongIcon", "chessIcon",  "pokerIcon", "fencingIcon", "cybesportIcon"]
    }
}
