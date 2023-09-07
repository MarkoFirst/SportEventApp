//
//  EventInfoVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.09.2023.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let newsCellId = "newsCell"
    private let sportTCellId = "sportTCell"
    private let eventCellId = "eventCell"
    
    private var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: newsCellId)
        tableView.register(UINib(nibName: "SportTVC", bundle: nil), forCellReuseIdentifier: sportTCellId)
        tableView.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: eventCellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // SportEvent instance "event1"
        let event1 = createEvent(teams: [chicagoBulls, lakers], date: Date(), title: "Basketball match", place: staplesCenter, description: "")
        events.append(event1)
        
        // SportEvent instance "event2"
        let event2 = createEvent(teams: [celtics, warriors], date: Date(), title: "Basketball match", place: staplesCenter, description: "")
        events.append(event2)
        
        // SportEvent instance "event2"
        let event3 = createEvent(teams: [heat, nets], date: Date(), title: "Basketball match", place: staplesCenter, description: "")
        events.append(event3)
        
        // SportEvent instance "event2"
        let event4 = createEvent(teams: [sixers, bucks], date: Date(), title: "Basketball match", place: staplesCenter, description: "")
        events.append(event4)
    }
    
    func createEvent(teams: [Team], date: Date, title: String, place: Place, description: String) -> Event {
        guard let commonSport = teams.first?.sport.type,
              teams.allSatisfy({ $0.sport.type == commonSport }),
              let equipment = teams.first?.sport.equipment,
              teams.allSatisfy({ $0.sport.equipment == equipment })
        else {
            fatalError("Невірні дані для створення події.")
        }
        
        let event = SportEvent(
            title: title,
            description: description,
            date: date,
            location: place,
            tickets: place.tickets,
            sport: Sport(type: commonSport, equipment: equipment),
            teams: teams
        )
        
        return event
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return events.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: newsCellId, for: indexPath) as? NewsTVC else {
                return UITableViewCell()
            }
            
            if let coverImage = newsCell.coverImage {
                coverImage.image = UIImage(named: "target")
            }
            
            return newsCell
            
        } else if indexPath.section == 1 {
            guard let sportCell = tableView.dequeueReusableCell(withIdentifier: sportTCellId, for: indexPath) as? SportTVC else {
                return UITableViewCell()
            }
            
            return sportCell
            
        } else if indexPath.section == 2 {
            guard let eventCell = tableView.dequeueReusableCell(withIdentifier: eventCellId, for: indexPath) as? EventTVC else {
                return UITableViewCell()
            }
            
            guard let sportEvent = events[indexPath.row] as? SportEvent else {
                return UITableViewCell()
            }
            
            // Setup first team label
            if let firstTeamLabel = eventCell.firstTeamLabel {
                firstTeamLabel.text = sportEvent.teams.first?.name ?? "Unknown team"
            }
            
            // Setup second team label
            if let secondTeamLabel = eventCell.secondTeamLabel {
                secondTeamLabel.text = sportEvent.teams.last?.name ?? "Unknown team"
            }
            
            // Setup first team logo
            if let firstTeamImage = eventCell.firstTeamImage {
                if let firstTeamLogoName = sportEvent.teams.first?.logo {
                    firstTeamImage.image = UIImage(named: firstTeamLogoName) ?? UIImage(named: "unknown")
                }
            }
            
            // Setup second team logo
            if let secondTeamImage = eventCell.secondTeamImage {
                if let secondTeamLogoName = sportEvent.teams.last?.logo {
                    secondTeamImage.image = UIImage(named: secondTeamLogoName) ?? UIImage(named: "unknown")
                }
            }
            
            return eventCell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0, 1:
            return ""
        case 2:
            return "Live Match"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 252
        case 1:
            return 102
        case 2:
            return 80
        default:
            return 0
        }
    }
}


