import Foundation
class Fan {
    let name: String
    var favoriteEvents: [SportEvent]
    var favoriteTeams: [Team]
    
    init(name: String) {
        self.name = name
        self.favoriteEvents = []
        self.favoriteTeams = []
    }
}
