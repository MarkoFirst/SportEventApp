import Foundation
class Team: Favoritable {
    var isFavorite: Bool = false
    let name: String?
    let player: [Athlete]
    let coach: String
    let teamFoundingDate: Date
    let sport: Sport

    init(name: String? = nil, players: [Athlete] , coach: String, teamFoundingDate: Date, sport: Sport) {
        self.name = name
        self.player = player
        self.coach = coach
        self.teamFoundingDate = teamFoundingDate
        self.sport = sport
    }

    func toggleFavorite() {
            isFavorite.toggle()
        }
}
