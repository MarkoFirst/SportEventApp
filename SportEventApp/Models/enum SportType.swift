//
//  enum SportType.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

enum TeamTypeSport  {
    
    case football
    case basketball
    case volleyball
    
    var equipment: String {
        switch self {
        case .football:
            return "футбольный мяч"
        case .basketball:
            return "баскетбольный мяч"
        case .volleyball:
            return "воллейбольный мяч"
        }
    }
    
    var descriptions : String {
        switch self {
        case .football:
            return "футбол"
        case .basketball:
            return "баскетбол"
        case .volleyball:
            return "воллейбол"
        }
    }
}


