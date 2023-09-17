
import Foundation


class Athlete: Favoritable {
    var isFavorite: Bool = false
    let firstName: String
    let lastName: String
    let age: UInt
    let country: String
    let gender: Gender
    
    
    init(firstName: String, lastName: String, age: UInt, country: String, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.country = country
        self.gender = gender
    }

    func toggleFavorite() {
            isFavorite.toggle()
        }
}
