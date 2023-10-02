//
//  MainTableVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 03.09.2023.
//

import Foundation
import UIKit

class MainTableVC: UIViewController {
    
    var athlete: Athlete?
    
    private let liveScoreId = "liveScoreId"
    private let sportsTVCId = "sportsTVC"
    private let eventTypeTVCId = "eventTypeId"
    private let eventsHeaderTVCId = "eventsHeaderTVCId"
    private let eventTVCId = "eventTVCId"
    var events: [Event] = []
    var filterTypes: [TypeOfSport] = []
    
    @IBOutlet weak var tableViev: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViev.delegate = self
        tableViev.dataSource = self
        tableViev.register(UINib(nibName: "LiveScoreTVC", bundle: nil), forCellReuseIdentifier: liveScoreId)
        tableViev.register(UINib(nibName: "EventTypeTVC", bundle: nil), forCellReuseIdentifier: eventTypeTVCId)
        tableViev.register(UINib(nibName: "EventsSectionCustomHeaderTVC", bundle: nil), forCellReuseIdentifier: eventsHeaderTVCId)
        tableViev.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: eventTVCId)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        createTestData()
    }
    
    @IBAction func PlayerInfoBtn(_ sender: UIButton) {
        if let athlete = athlete {
            let vc = PlayerInfoVC()
            navigationController?.pushViewController(vc, animated: true)
            vc.athlete = athlete
        }
    }
}

extension MainTableVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return events.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let liveScoreCell = tableView.dequeueReusableCell(withIdentifier: liveScoreId, for: indexPath) as! LiveScoreTVC
        let eventTypeCollectionCell = tableView.dequeueReusableCell(withIdentifier: eventTypeTVCId, for: indexPath) as! EventTypeTVC
        let eventSectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: eventsHeaderTVCId, for: indexPath) as! EventsSectionCustomHeaderTVC
        let eventTVCCell = tableView.dequeueReusableCell(withIdentifier: eventTVCId, for: indexPath) as! EventTVC
        
        switch indexPath.section {
            
        case 0:
            return liveScoreCell
            
        case 1:
            return eventTypeCollectionCell
            
        case 2:
            return eventSectionHeaderCell
            
        case 3:
            
            if let event = events[indexPath.row] as? TeamSportEvent {
                eventTVCCell.firstTeamOrAtheleName?.text = event.teams.enumerated().map({$1.name})[0]
                eventTVCCell.secondTeamOrAthleteName?.text = event.teams.enumerated().map({$1.name})[1]
                eventTVCCell.firstTeamOrAthleteIcon?.image = event.teams[0].icon
                eventTVCCell.secondTeamOrAthleteIcon?.image = event.teams[1].icon
            } else if let event = events[indexPath.row] as? DoublesSportEvent {
                eventTVCCell.firstTeamOrAtheleName?.text = event.athletes.enumerated().map({$1.lastName})[0]
                eventTVCCell.secondTeamOrAthleteName?.text = event.athletes.enumerated().map({$1.lastName})[1]
                eventTVCCell.firstTeamOrAthleteIcon?.image = event.athletes[0].icon
                eventTVCCell.secondTeamOrAthleteIcon?.image = event.athletes[1].icon
            }
            
            eventTVCCell.dateEventLabel.text = events[indexPath.row].date
            eventTVCCell.coutryEventLabel.text = events[indexPath.row].place.contry.rawValue
            
            return eventTVCCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "eventStoryboard") as! EventInfoVC
            self.navigationController?.pushViewController(vc, animated: true)
            vc.event = events[indexPath.row]
        }
    }
}

extension MainTableVC {
    
    func createTestData() {
        
        // Teams
        let juventus = Team(name: "Juventus", createYear: 1897, coach: "Massimiliano Allegri", sport: .football, team: nil, country: .Italy, iconName: "juventusFlag")
        
        let barcelona = Team(name: "Barcelona", createYear: 1899, coach: "Ronald Koeman", sport: .football, team: nil, country: .Spain, iconName: "barcelonaLogo")
        
        let psg = Team(name: "Paris Saint-Germain", createYear: 1970, coach: "Mauricio Pochettino", sport: .football, team: nil, country: .France, iconName: "psgLogo")
        
        let manCity = Team(name: "Manchester City", createYear: 1880, coach: "Pep Guardiola", sport: .football, team: nil, country: .UnitedKingdom, iconName: "mcLogo")
        
        let realMadrid = Team(name: "Real Madrid", createYear: 1902, coach: "Carlo Ancelotti", sport: .football, team: nil, country: .Spain, iconName: "realLogo")
        
        let navi = Team(name: "Natus Vincere", createYear: 2009, coach: "Andrey Gorodenskiy", sport: .cybersport, team: nil, country: .Ukraine, iconName: "naviLogo")
        
        let virtuspro = Team(name: "Virtus.pro", createYear: 2003, coach: "Dzhami Ali", sport: .cybersport, team: nil, country: .Other, iconName: "virtusproLogo")
        
        // Ronaldo Teams
        let ronaldoManUtd = AthleteTeams(team: "Manchester United", teamColor: UIColor.red, fromYearInTeam: 2003, toYearInTeam: 2009, iconName: "manUTeamLogo")
        
        let ronaldoReal = AthleteTeams(team: "Real Madrid", teamColor: UIColor.orange, fromYearInTeam: 2009, toYearInTeam: 2018, iconName: "realTeamLogo")
        
        let ronaldoJuventus = AthleteTeams(team: "Juventus", teamColor: UIColor.white, fromYearInTeam: 2018, toYearInTeam: 2023, iconName: "juventusFlag")
        
        //Trophies
        let europeanCup = Trophy(name: "European cup", count: 3, iconName: "eurocup")
        let fifaCLubWorldCup = Trophy(name: "FIFA CLub World cup", count: 3, iconName: "fifaCup")
        let europeanSuperCup = Trophy(name: "European super cup", count: 2, iconName: "uefaCup")
        let fifaWorldCup = Trophy(name: "FIFA World cup", count: 0, iconName: "fifaWorldCup")
        
        // Athletes
        let ronaldo = Athlete(firstName: "Cristiano", lastName: "Ronaldo", age: 33, typeOfSport: .football, gamesValue: 14, goalsValue: 10, athleteTeam: juventus, atheleBigImageName: "ronaldoLogo", athleteRole: "FORWARD", allKicks: 14, shotOnTarget: 8, goalsScored: 6, foulsWon: 8, foulsConceded: 3, redCards: 1, yellowCards: 3, trophies: [europeanCup, fifaCLubWorldCup, europeanSuperCup, fifaWorldCup], teams: [ronaldoManUtd, ronaldoReal, ronaldoJuventus], citizenship: .Portugal, birthplace: .Portugal, gender: .male, sport: .football, number: 7, iconName: "ronaldoIcon")
        
        athlete = ronaldo
        
        let djokovic = Athlete(firstName: "Novak", lastName: "Djokovic", age: 34, typeOfSport: .tennis, gamesValue: 18, goalsValue: 12, athleteTeam: nil, atheleBigImageName: "djokovicFlag", athleteRole: "TENNIS PLAYER", allKicks: 142, shotOnTarget: 92, goalsScored: 32, foulsWon: 25, foulsConceded: 8, redCards: 0, yellowCards: 2, trophies: nil, teams: nil, citizenship: .Serbia, birthplace: .Other, gender: .male, sport: .tennis, number: 1, iconName: "djokovicLogo")
        
        let nadal = Athlete(firstName: "Rafael", lastName: "Nadal", age: 35, typeOfSport: .tennis, gamesValue: 20, goalsValue: 15, athleteTeam: nil, atheleBigImageName: "nadalFlag", athleteRole: "TENNIS PLAYER", allKicks: 155, shotOnTarget: 105, goalsScored: 40, foulsWon: 28, foulsConceded: 10, redCards: 0, yellowCards: 1, trophies: nil, teams: nil, citizenship: .Spain, birthplace: .Other, gender: .male, sport: .tennis, number: 2, iconName: "nadaleLogo")
        
        func createEvent(participant: [Participant], date: String, typeOfSport: TypeOfSport, title: String, place: Place, description: String, iconName: String) -> Event? {
            
            switch participant {
                
            case let participant_ as [Team]:
                let text = "\(description). The event type of \(typeOfSport.rawValue) betwen \(participant_.enumerated().map( { "\($1.name)"}).joined(separator: " - ")) will be held on \(date) at \(place.name), the price of participation in the event is from \(place.priceFrom) \(place.currency) to \(place.priceTo) \(place.currency)."
                let event = TeamSportEvent(teams: participant_, typeOfSport: typeOfSport, title: title, description: text, date: date, place: place, currency: place.currency, iconName: iconName)
                events.append(event)
                
                return event
                
            case let participant_ as [Athlete]:
                let text = "\(description). The event type of \(typeOfSport.rawValue) betwen \(participant_.enumerated().map( { "\($1.firstName) \($1.lastName)"}).joined(separator: " - ")) will be held on \(date) at \(place.name), the price of participation in the event is from \(place.priceFrom) to \(place.priceTo) \(place.currency)."
                let event = DoublesSportEvent(athletes: participant_, typeOfSport: typeOfSport, title: title, description: text, date: date, place: place, currency: place.currency, iconName: iconName)
                events.append(event)
                
                return event
            default:
                return nil
            }
        }
        
        let firstEvent = createEvent(participant: [manCity, barcelona], date: "Mon, March 23, 21", typeOfSport: .football, title: "Championship. Event 1", place: Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Отбор", iconName: "EventFirst")
        
        let secondEvent = createEvent(participant: [psg, realMadrid], date: "Fri, Febr 24, 11", typeOfSport: .football, title: "World Cup. Event 2", place: Place(name: "Wembley", type: .stadium, contry: .UnitedKingdom, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Final", iconName: "EventSecond")
        
        let thirdEvent = createEvent(participant: [navi, virtuspro], date: "Wed, Jan 24, 01", typeOfSport: .cybersport, title: "World Cyber Cup. Event 3", place: OnlinePlace(urlAdress: "www.game.com", language: [.English], name: "Game.com", type: .internet, contry: .UnitedStates, maxSpectatorsCount: 1000, typeSport: [.cybersport], priceFrom: 100, priceTo: 1000, currency: .USD), description: "1/4 Final", iconName: "EventThird")
        
        let fourthEvent = createEvent(participant: [djokovic, nadal], date: "Mon, Jul 24, 12", typeOfSport: .tennis, title: "Cup. Event 4", place: Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [.tennis, .volleyball], priceFrom: 100, priceTo: 3000, currency: .USD), description: "Friendly game", iconName: "EventFourth")
    }
}
