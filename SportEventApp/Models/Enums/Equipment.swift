//
//  Equipment.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

enum Equipment: String {
    case ball = "Ball"
    case racket = "Racket"
    case basket = "Basket"
    case net = "Net"
    case helmet = "Helmet"
    case chessSet = "Chess set"
    
    var description: String {
        return rawValue
    }
}
