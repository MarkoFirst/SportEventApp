//
//  enum EventType.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

extension Event {
    
    enum EventType {
        case training
        case match
        case tournament
        
        var descriptions: String {
            switch self {
            case .training:
                return "Треннировка"
            case .match:
                return "Матч"
            case .tournament:
                return "Турнир"
                
            }
        }
    }
}
