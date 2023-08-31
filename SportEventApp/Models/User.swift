import Foundation
class User {
    let name: String
    var favoriteEvents: [SportEvent]
    var favoriteTeams: [Team]
    var favoritePlayers: [Player]
    
    init(name: String) {
        self.name = name
        self.favoriteEvents = []
        self.favoriteTeams = []
        self.favoritePlayers = []
    }
}
