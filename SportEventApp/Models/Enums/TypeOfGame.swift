//
//  TypeOfGame.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

enum TypeOfGame: String {
    case double = "Doubles sport"
    case team = "Teams sport"
    
    static var allCases: [TypeOfGame] {
        return [.double, .team]
    }
}
