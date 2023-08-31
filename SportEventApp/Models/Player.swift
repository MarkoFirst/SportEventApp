import Foundation
enum PlayerPosition {
    case forward
    case midfielder
    case defender
    case goalkeeper
}
enum Gender {
    case male
    case female
}
class Player {
    let name: String
    var age: Int
    var skillLevel: Int
    var country: String
    var number: Int
    var gender: Gender
    var position: PlayerPosition
    
    init(name: String, age: Int, skillLevel: Int, country: String, number: Int, gender: Gender, position: PlayerPosition) {
        self.name = name
        self.age = age
        self.skillLevel = skillLevel
        self.country = country
        self.number = number
        self.gender = gender
        self.position = position
    }
    
    func train() {
    }
}
