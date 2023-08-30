//
//  Sport.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Sport: Favoritable {
    var isFavorite: Bool = false
    let type: SportType
    let equipment: [Equipment]
       
    init(type: SportType, equipment: [Equipment]) {
        self.type = type
        self.equipment = equipment
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}

let basketball = Sport(type: .team(.basketball), equipment: [.ball, .basket])
let football = Sport(type: .team(.football), equipment: [.ball, .net])
let tennis = Sport(type: .individualteam(.tennis), equipment: [.ball, .racket])
let chess = Sport(type: .individual(.chess), equipment: [.chessSet])


