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
    
    func addEventToFav(element: Event) {
        savedEvent.append(element)
    }
    
    func deleteEventFromFav(element: Event) {
            if let index = savedEvent.firstIndex(of: element) {
                savedEvent.remove(at: index)
            }
        }
    
    
    func addFavSport(element: SportTypes) {
        favSport.append(element)
    }
    
    func deleteFavSport(element: SportTypes) {
            if let index = favSport.firstIndex(of: element) {
                favSport.remove(at: index)
            }
        }
    
    
    
    func addFavTeam(element: Team) {
        favTeam.append(element)
    }
    
    func deleteFavTeam(element: Team) {
            if let index = favTeam.firstIndex(of: element) {
                favTeam.remove(at: index)
            }
        }
    
    
    
    func affFavAthlete(element: Athlete) {
        favAthletes.append(element)
    }
    
    func deleteFavAthletes(element: Athlete) {
            if let index = favAthletes.firstIndex(of: element) {
                favAthletes.remove(at: index)
            }
        }
    
    }


