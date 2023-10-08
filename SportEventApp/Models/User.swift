//
//  User.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var login: String
    @Persisted var email: String
    @Persisted var password: String
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    private var userSettings: Settings?
    var favoritesEvent: [Event] = []
    var favoritesSport: [Sport] = []
    var favoritesTeam: [Team] = []
    var favoritesAthlete: [Athlete] = []
    
    convenience init(login: String, email: String, password: String) {
        self.init()
        self.login = login
        self.email = email
        self.password = password
    }
    
    func changeEmail(to newEmail: String) {
        self.email = newEmail
    }
    
    func addFavoriteEvent(event: Event) {
        self.favoritesEvent.append(event)
    }
    
    func addFavoriteSport(sport: Sport) {
        self.favoritesSport.append(sport)
    }
    
    func addFavoriteTeam(team: Team) {
        self.favoritesTeam.append(team)
    }
    
    func addFavoriteAthlete(athlete: Athlete) {
        self.favoritesAthlete.append(athlete)
    }
    
    func clanAllFavorites() {
        self.favoritesTeam = []
        self.favoritesEvent = []
        self.favoritesSport = []
        self.favoritesAthlete = []
    }
}
