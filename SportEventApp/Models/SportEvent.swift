import Foundation
enum EventType {
    case practice
    case tournament
    case friendlyMatch
}
class SportEvent {
    let name: String
    var location: String
    var date: Date
    var description: String
    var price: Double
    
    init(name: String, location: String, date: Date, description: String, price: Double) {
        self.name = name
        self.location = location
        self.date = date
        self.description = description
        self.price = price
    }
}
