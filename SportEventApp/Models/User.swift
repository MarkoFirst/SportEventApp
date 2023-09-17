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
    func editLastName(to lastName: String) -> String {
        return lastName
    }
    func editFirstName(to firstName: String) -> String {
           return firstName
       }
    func editEmail(to email: String) -> String {
            return email
        }
    }
