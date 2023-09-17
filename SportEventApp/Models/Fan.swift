import Foundation
class Fan {
    let team: Team
    var sportType: TypeOfSport
    var sportEvents: Event
    var fanInfo: User
    
    init(team: Team, sportType: TypeOfSport, sportEvents: Event, fanInfo: User) {
        self.team = team
        self.sportType = sportType
        self.sportEvents = sportEvents
        self.fanInfo = fanInfo
    }
    

}

