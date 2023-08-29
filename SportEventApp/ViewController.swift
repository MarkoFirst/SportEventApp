//
//  ViewController.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

