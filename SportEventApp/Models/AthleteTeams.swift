//
//  AthleteTeams.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 01.10.2023.
//

import Foundation
import UIKit

class AthleteTeams {
    var team: String
    var teamColor: UIColor?
    var fromYearInTeam: UInt
    var toYearInTeam: UInt
    var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }

    init(team: String, teamColor: UIColor?, fromYearInTeam: UInt, toYearInTeam: UInt, iconName: String) {
        self.team = team
        self.teamColor = teamColor
        self.fromYearInTeam = fromYearInTeam
        self.toYearInTeam = toYearInTeam
        self.iconName = iconName
    }
}
