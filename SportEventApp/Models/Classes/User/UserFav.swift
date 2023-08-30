//
//  Usre.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class UserFav {
    var savedEvent: [Event]
    var favSport: [SportTypes]
    var favTeam: [Team]
    var favAthletes: [Athlete]
    
    init(savedEvent: [Event], favSport: [SportTypes], favTeam: [Team], favAthletes: [Athlete]) {
        self.savedEvent = savedEvent
        self.favSport = favSport
        self.favTeam = favTeam
        self.favAthletes = favAthletes
    }
    
    func saveEvent(element: Event) {
        savedEvent.append(element)
    }
    
    func addFavSport(element: SportTypes) {
        favSport.append(element)
    }
    func addFavTeam(element: Team) {
        favTeam.append(element)
    }
    func addFavAthlete(element: Athlete) {
        favAthletes.append(element)
    }
}

