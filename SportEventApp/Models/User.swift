//
//  User.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation
import RealmSwift

protocol Favoritable {
    var isFavorite: Bool { get set }
    func toggleFavorite()
}

class User: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var firstName: String = ""
    var lastName: String = ""
    @Persisted var email: String = ""
    @Persisted var password: String = ""
    var favorites: [Favoritable] = []
    
    convenience init(firstName: String, email: String, password: String) {
        self.init()
        self.firstName = firstName
        self.email = email
        self.password = password
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
