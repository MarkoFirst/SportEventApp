//
//  SportEvent.swift
//  SportEventApp
//
//  Created by Ernest Asanov on 30.08.2023.
//

import Foundation
class SportEvent {
    var team: Team
    var sport: Sport
    
    init(team: Team, sport: Sport) {
          self.team = team
          self.sport = sport
      }
}
