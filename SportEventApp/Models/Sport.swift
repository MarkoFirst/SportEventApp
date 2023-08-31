import Foundation
class Sport {
    let name: String
    var teams: [Team]
    var events: [SportEvent]
    
    init(name: String) {
        self.name = name
        self.teams = []
        self.events = []
    }
    
    func startEvent(team: Team, event: SportEvent) {
    }
}
