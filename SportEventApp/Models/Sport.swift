//
//  Sport.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

class Sport: Favoritable {
    var isFavorite: Bool = false
    let sportImage: String?
    var name: String? 
    let type: SportType
    let equipment: [Equipment]
       
    init(sportImage: String? = nil, name: String? = nil, type: SportType, equipment: [Equipment]) {
        self.sportImage = sportImage
        self.name = name
        self.type = type
        self.equipment = equipment
    }
    
    func toggleFavorite() {
            isFavorite.toggle()
        }
}




