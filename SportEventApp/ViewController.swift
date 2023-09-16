//
//  ViewController.swift
//  SportEvent
//
//

import UIKit

//let barcaAth = [Athlete(name: "Lionel Messi", age: 34, number: 10, gender: .male, country: .argentina),
//                Athlete(name: "Gerard Piqué", age: 34, number: 3, gender: .male, country: .spain),
//                Athlete(name: "Ansu Fati", age: 18, number: 22, gender: .male, country: .spain),
//                Athlete(name: "Alexia Putella", age: 28, number: 11, gender: .female, country: .spain)]
//
//let realAth = [Athlete(name: "Karim Benzema", age: 33, number: 9, gender: .male, country: .france),
//               Athlete(name: "Sergio Ramos", age: 35, number: 4, gender: .male, country: .spain),
//               Athlete(name: "Vinicius Junior", age: 21, number: 20, gender: .male, country: .brazil),
//               Athlete(name: "Toni Kroos", age: 31, number: 8, gender: .male, country: .germany)]
//
//let teams = [Team(teamName: "Barcelona", athletes: barcaAth, dateCreate: "19.08.1978", coach: "Ivan Ivanov", sport: .football),
//            Team(teamName: "Real Madrid", athletes: realAth, dateCreate: "12.01.1966", coach: "Petro Petrov", sport: .football)]
//
//let attStadium = Place(nameOfPlace: "AT&T STADIUM", numberOfSeatPlaces: 80000, sport: .football, country: .usa, city: "Dallas", adress: "1 AT&T Way, TX 76011", price: "90$")
//
//let pair = [PairGames(rank: "GrandMaster", name: "Ivan Ivanov", age: 23, gender: .male, country: .ukraine, sport: .chess),
//            PairGames(rank: "GrandMaster", name: "Dima Dimenko", age: 25, gender: .male, country: .ukraine, sport: .chess)]
//
//let lokomotivCentre = Place(nameOfPlace: "Lokomotiv", numberOfSeatPlaces: 1000, sport: .chess, country: .ukraine, city: "Kharkiv", adress: "Evgen Kotlyar street, 15V", price: "14.99$")



let firstTeamPlayingInFuture = Team(teamName: "Liverpool", athletes: [Athlete(name: "", age: 0, number: 0, gender: .female, country: .argentina)], dateCreate: "", coach: "", sport: .football, teamLogo: UIImage(named: "liverpoolLogo") ?? UIImage())

let secondTeamPlayingInFuture = Team(teamName: "Juventus", athletes: [Athlete(name: "", age: 0, number: 0, gender: .female, country: .argentina)], dateCreate: "", coach: "", sport: .football, teamLogo: UIImage(named: "juventusLogo") ?? UIImage())

let testEvent = Event(title: "", description: "", date: "Mon ,29th March, 21:00", place: place, soldTickets: 0, teams: [team1, team2], pairs: nil)

class ViewController: UIViewController {
        
    @IBOutlet weak var pushToMainMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(createEvent(teams: teams, place: attStadium, date: "29.10.2023", soldTickets: 78098))
//        print(createEvent(athlete: pair, place: lokomotivCentre, date: "23.11.2023", soldTickets: 100))
    }
    
    @IBAction func pushToMainMenu(_ sender: UIButton) {
        navigationController?.pushViewController(WelcomeVC(), animated: true)
    }
    
    
   
}






