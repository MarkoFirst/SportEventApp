//
//  SportType.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

enum SportType: Equatable {
    case individual(IndividualSport)
    case team(TeamSport)
    case individualteam(IndividualTeamSport)
    
    enum IndividualSport: String {
        case running = "Running"
        case chess = "Chess"
        
        var description: String {
            return rawValue
        }
    }
    
    enum TeamSport: String {
        case football = "Football"
        case basketball = "Basketball"
        case soccer = "Soccer"
        
        var description: String {
            return rawValue
        }
        
        
    }
    
    enum IndividualTeamSport: String {
        case tennis = "Tennis"
        
        var description: String {
            return rawValue
        }
        
        
    }
    
//    var area: (UInt, UInt){
//        switch {
//        case .football:
//            return (180, 90)
//        case .basketball:
//            return (44, 27)
//        }
//    }
}
