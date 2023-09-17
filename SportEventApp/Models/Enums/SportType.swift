
import Foundation


enum SportType: Equatable {
    
    case individual(IndividualSport)
    case individualTeam(IndividualTeamSport)
    case team(TeamSport)
    
    enum IndividualSport: String {
        case run = "Run"
        case chess = "Chesss"
        
        var description: String {
            return rawValue
        }
    }
    
    enum IndividualTeamSport: String {
        case poker = "Cards"
        
        var description: String {
            return rawValue
        }
    }
    
    case basketball = "Basketball"
    case football = "Football"
    
    
    var description: String {
        return rawValue
    }
}
