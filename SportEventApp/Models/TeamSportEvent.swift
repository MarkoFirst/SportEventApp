//
//  TeamSportEvent.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import UIKit
import RealmSwift

class TeamSportEvent: SportEvent {
    @Persisted var teams: List<Team>
    
    convenience init(title: String, desc: String, date: Date, place: Place?, currency: CurrencyList.RawValue, icon: Data, typeOfSport: TypeOfSport, teams: List<Team>) {
        self.init(title: title, desc: desc, date: date, place: place, currency: currency, icon: icon, typeOfSport: typeOfSport)
        self.teams = teams
    }
}
