//
//  Sport.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

class Sport {
    
    var typeSport: String
    
    init( typeSport: TeamTypeSport) {
        self.typeSport = typeSport.descriptions
    }
}
