//
//  SecondaryTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 07.09.2023.
//

import UIKit

class SecondaryTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamLogo: UIImageView!
    @IBOutlet weak var secondTeamLogo: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        firstTeamLogo.image = firstTeamPlayingInFuture.teamLogo
        secondTeamLogo.image = secondTeamPlayingInFuture.teamLogo
        firstTeamName.text = firstTeamPlayingInFuture.teamName
        secondTeamName.text = secondTeamPlayingInFuture.teamName
        dateLabel.text = testEvent.date
    }
    
}

