import Foundation
class Team {
    let name: String
    var players: [Player]
    var creationDate: Date
    var coach: Coach?
    var sport: Sport
    
    init(name: String) {
        self.name = name
        self.players = []
        self.creationDate = Date()
        self.coach = nil
        self.sport = Sport(name: "")
    }
    
    func addPlayer(_ player: Player) {
        players.append(player)
    }
}
