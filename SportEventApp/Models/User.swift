//
//  User.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

protocol Favoritable {
    var isFavorite: Bool { get set }
    func toggleFavorite()
}

class User {
    private var firstName: String
    private var lastName: String
    private var email: String
    var favorites: [Favoritable]
    
    init(firstName: String, lastName: String, email: String, favorites: [Favoritable]) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.favorites = favorites
    }
    
    func editFirstName(to firstName: String) -> String {
        return firstName
    }
    
    func editLastName(to lastName: String) -> String {
        return lastName
    }
    
    func editEmail(to email: String) -> String {
        return email
    }
}
