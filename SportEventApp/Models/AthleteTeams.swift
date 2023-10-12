//
//  AthleteTeams.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 01.10.2023.
//

import Foundation
import UIKit
import RealmSwift

class AthleteTeams: Object {
    @Persisted var team: String
    @Persisted var teamColor: ColorsList.RawValue
    @Persisted var fromYearInTeam: Int
    @Persisted var toYearInTeam: Int
    @Persisted var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    var uiColor: UIColor? {
        return ColorsList(rawValue: teamColor)?.uiColor
    }
    
    convenience init(team: String, teamColor: ColorsList, fromYearInTeam: Int, toYearInTeam: Int, iconName: String) {
        self.init()
        self.team = team
        self.teamColor = teamColor.rawValue
        self.fromYearInTeam = fromYearInTeam
        self.toYearInTeam = toYearInTeam
        self.iconName = iconName
    }
}
