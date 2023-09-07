//
//  Sports.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 07.09.2023.
//

import Foundation

// Sport instances
let basketball = Sport(sportImage: "basketball", name: "Basketball", type: .team(.basketball), equipment: [.ball, .basket])
let football = Sport(sportImage: "football", name: "Football", type: .team(.football), equipment: [.ball, .net])
let tennis = Sport(sportImage: "tennis", name: "Tennis", type: .individualteam(.tennis), equipment: [.ball, .racket])
let chess = Sport(sportImage: "chess", name: "Chess", type: .individual(.chess), equipment: [.chessSet])

