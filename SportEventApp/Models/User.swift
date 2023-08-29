//
//  User.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class User {
    let id: UInt
    private var email: String
    private var phoneNumber: String
    private var firstName: String
    private var lastName: String
    private let birthday: String
    private var userSettings: Settings
    var favoritesEvent: [Event] = []
    var favoritesSport: [Sport] = []
    var favoritesTeam: [Team] = []
    var favoritesAthlete: [Athlete] = []
    
    init(id: UInt, email: String, phoneNumber: String, firstName: String, lastName: String, birthday: String, userSettings: Settings) {
        self.id = id
        self.email = email
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.userSettings = userSettings
    }
    
    func changeEmail(to newEmail: String) {
        self.email = newEmail
    }
    
    func changePhoneNumber(to newPhoneNumber: String) {
        self.phoneNumber = newPhoneNumber
    }
    
    func changeFirstName(to newFirstName: String) {
        self.firstName = newFirstName
    }
    
    func changeLastName(to newLastName: String) {
        self.lastName = newLastName
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
