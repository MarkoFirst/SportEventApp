//
//  MainTableviewTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 06.09.2023.
//

import UIKit

class MainTableviewTableViewCell: UITableViewCell {
    @IBOutlet weak var firstTeamLogo: UIImageView!
    @IBOutlet weak var secondTeamLogo: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!

    @IBOutlet weak var pushButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        firstTeamLogo.image = team1.teamLogo
        secondTeamLogo.image = team2.teamLogo
        firstTeamName.text = team1.teamName
        secondTeamName.text = team2.teamName
        score.text = testFinishedEvent.score
    }
    
    
    @IBAction func pushButton(_ sender: UIButton) {
        if let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionViewController {
               if let navigationController = self.window?.rootViewController as? UINavigationController {
                   // Выполнить переход
                   navigationController.pushViewController(destinationViewController, animated: true)
               }
           }
    }
    
}

let team1 = Team(teamName: "Barcelona", athletes: [Athlete(name: "", age: 0, number: 0, gender: .female, country: .argentina)], dateCreate: "", coach: "", sport: .football, teamLogo: UIImage(named: "barcelonaLogo") ?? UIImage())

let team2 = Team(teamName: "Real Madrid", athletes: [Athlete(name: "", age: 0, number: 0, gender: .female, country: .argentina)], dateCreate: "", coach: "", sport: .football, teamLogo: UIImage(named: "realMadridLogo") ?? UIImage())
let place = Place(nameOfPlace: "", numberOfSeatPlaces: 0, sport: .football, country: .argentina, city: "", adress: "", price: "")

let testFinishedEvent = FinishedEvent(title: "Ibrahimovic: Sweden return is not easy for my family.", description: "Zlatan Ibrahimovic amdfk;amf aflkal;fa,fmk;amd kdfl;akf;lakfl;a kafl;afk;l fafkl;a,fl;almf faflaf;lm;f lakfl;amfl;maf;lamf aflmal;fmal;kfmaf flakmfl;amfm lml;afma falfa \n zdmf;lzdf;lzl;fz  m;lmv;mv;ldzf;lzlf,;l;l l,a;d,f,a;l,dl;,a l;sdl;as", date: "", place: place, soldTickets: 0, teams: [team1, team2], pairs: nil, score: "0 - 0")

