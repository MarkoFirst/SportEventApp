//
//  TeamSportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class TeamSportEvent: SportEvent {
    var teams: [Team]
    
    init(teams: [Team], typeOfSport: TypeOfSport, title: String, description: String, date: String, place: Place, currency: CurrencyList) {
        self.teams = teams
        super.init(typeOfSport: typeOfSport, title: title, description: description, date: date, place: place, currency: currency)
    }
}
