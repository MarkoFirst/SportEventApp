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
    
    private var events: [Event] = []
    
    struct Cells {
        static let newsCellId = "newsCell"
        static let sportTCellId = "sportTCell"
        static let eventCellId = "eventCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: Cells.newsCellId)
        tableView.register(UINib(nibName: "SportTVC", bundle: nil), forCellReuseIdentifier: Cells.sportTCellId)
        tableView.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: Cells.eventCellId)
        
        events = fetchData()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        let newsCell = tableView.dequeueReusableCell(withIdentifier: Cells.newsCellId) as! NewsTVC
        let sportCell = tableView.dequeueReusableCell(withIdentifier: Cells.sportTCellId) as! SportTVC
        let eventCell = tableView.dequeueReusableCell(withIdentifier: Cells.eventCellId) as! EventTVC
        
        switch indexPath.section {
        case 0:
            return newsCell
        case 1:
            return sportCell
        case 2:
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
            
            // Setup event date
            if let eventDate = eventCell.eventDateLabel {
                eventDate.text = sportEvent.dateCompactString
            }
            
            return eventCell
        default:
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "eventInfo") as! EventInfoVC
            self.navigationController?.pushViewController(vc, animated: true)
            vc.event = events[indexPath.row]
            
        }
    }
}

extension HomeVC {
    
    func fetchData() -> [Event] {
        // Create Date objects for each event with different dates
        let date1 = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 28, hour: 18, minute: 0))!
        let date2 = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 15, hour: 19, minute: 30))!
        let date3 = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 20, hour: 20, minute: 15))!
        let date4 = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 25, hour: 17, minute: 45))!
        
        func createEvent(teams: [Team], date: Date, title: String, place: Place, description: String, coverName: String?) -> Event {
            guard let commonSport = teams.first?.sport.type,
                  teams.allSatisfy({ $0.sport.type == commonSport }),
                  let equipment = teams.first?.sport.equipment,
                  teams.allSatisfy({ $0.sport.equipment == equipment }),
                  let sportName = teams.first?.sport.name,
                  teams.allSatisfy({ $0.sport.name == sportName })
            else {
                fatalError("Invalid event creation data.")
            }
            
            let event = SportEvent(
                eventCoverName: coverName,
                title: title,
                description: description,
                date: date,
                location: place,
                tickets: place.tickets,
                sport: Sport(name: sportName, type: commonSport, equipment: equipment),
                teams: teams
            )
            
            return event
        }
        
        let event1 = createEvent(teams: [chicagoBulls, lakers], date: date1, title: "High-Stakes Showdown: The Clash of Titans", place: staplesCenter, description: "Get ready for an electrifying night of basketball as two powerhouse teams collide in a thrilling match that promises to leave you on the edge of your seat. The tension is palpable, the excitement is contagious, and the hardwood court is about to witness a display of skill, athleticism, and teamwork like never before.", coverName: "bullsvslakers")
        
        let event2 = createEvent(teams: [celtics, warriors], date: date2, title: "High-Stakes Showdown: The Clash of Titans", place: staplesCenter, description: "Get ready for an electrifying night of basketball as two powerhouse teams collide in a thrilling match that promises to leave you on the edge of your seat. The tension is palpable, the excitement is contagious, and the hardwood court is about to witness a display of skill, athleticism, and teamwork like never before.", coverName: "celticsvswarriors")
        
        let event3 = createEvent(teams: [heat, nets], date: date3, title: "High-Stakes Showdown: The Clash of Titans", place: staplesCenter, description: "Get ready for an electrifying night of basketball as two powerhouse teams collide in a thrilling match that promises to leave you on the edge of your seat. The tension is palpable, the excitement is contagious, and the hardwood court is about to witness a display of skill, athleticism, and teamwork like never before.", coverName: "netsvsheat")
        
        let event4 = createEvent(teams: [sixers, bucks], date: date4, title: "High-Stakes Showdown: The Clash of Titans", place: staplesCenter, description: "Get ready for an electrifying night of basketball as two powerhouse teams collide in a thrilling match that promises to leave you on the edge of your seat. The tension is palpable, the excitement is contagious, and the hardwood court is about to witness a display of skill, athleticism, and teamwork like never before.", coverName: "76vsbucks")
        
        return [event1, event2, event3, event4]
    }
}
