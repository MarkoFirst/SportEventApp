import Foundation
enum LocationType {
    case indoor
    case outdoor
}
class Venue {
    let name: String
    let location: String
    let address: String
    let size: Int
    let capacity: Int
    let locationType: LocationType
    let sports: [Sport]
    var price: Double
    
    init(name: String, location: String, address: String, size: Int, capacity: Int, locationType: LocationType, sports: [Sport], price: Double) {
        self.name = name
        self.location = location
        self.address = address
        self.size = size
        self.capacity = capacity
        self.locationType = locationType
        self.sports = sports
        self.price = price
    }
}
