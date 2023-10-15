//
//  EventTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 04.09.2023.
//

import Foundation

import UIKit

@IBDesignable

class EventTVC: UITableViewCell {
    
    @IBOutlet weak var firstTeamOrAtheleName: UILabel!
    @IBOutlet weak var firstTeamOrAthleteIcon: UIImageView!
    @IBOutlet weak var secondTeamOrAthleteName: UILabel!
    @IBOutlet weak var secondTeamOrAthleteIcon: UIImageView!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var coutryEventLabel: UILabel!
}
