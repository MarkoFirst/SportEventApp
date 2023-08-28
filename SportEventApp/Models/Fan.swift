//
//  Fan.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Fan {
    var team: Team
    var sportType: TypeOfSport
    var sportEvents: Event
    var fanInfo: User
    
    init(team: Team, sportType: TypeOfSport, sportEvents: Event, fanInfo: User) {
        self.team = team
        self.sportType = sportType
        self.sportEvents = sportEvents
        self.fanInfo = fanInfo
    }
}
