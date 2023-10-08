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
    var events: [Event]?
    
    private let liveScoreId = "liveScoreId"
    private let sportsTVCId = "sportsTVC"
    private let eventTypeTVCId = "eventTypeId"
    private let eventsHeaderTVCId = "eventsHeaderTVCId"
    private let eventTVCId = "eventTVCId"
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
            return events?.count ?? 0
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
            tableView.layoutIfNeeded()
            return eventTypeCollectionCell
            
        case 2:
            return eventSectionHeaderCell
            
        case 3:
            
            if let event = events?[indexPath.row] as? TeamSportEvent {
                eventTVCCell.firstTeamOrAtheleName?.text = event.teams.first?.name
                eventTVCCell.secondTeamOrAthleteName?.text = event.teams.last?.name
                eventTVCCell.firstTeamOrAthleteIcon?.image = event.teams.first?.icon
                eventTVCCell.secondTeamOrAthleteIcon?.image = event.teams.last?.icon
            }
            
            if let event = events?[indexPath.row] as? DoublesSportEvent {
                eventTVCCell.firstTeamOrAtheleName?.text = event.athletes.first?.lastName
                eventTVCCell.secondTeamOrAthleteName?.text = event.athletes.last?.lastName
                eventTVCCell.firstTeamOrAthleteIcon?.image = event.athletes.first?.icon
                eventTVCCell.secondTeamOrAthleteIcon?.image = event.athletes.last?.icon
            }
            
            eventTVCCell.dateEventLabel.text = events?[indexPath.row].dateFormatter()
            eventTVCCell.coutryEventLabel.text = events?[indexPath.row].place.contry.rawValue
            
            return eventTVCCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "eventStoryboard") as! EventInfoVC
            self.navigationController?.pushViewController(vc, animated: true)
            vc.event = events?[indexPath.row]
        }
    }
}

extension MainTableVC {
    
    func createTestData() {
        
        // Places
        let donbassArena = Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH)
        let arturAsheStadium = Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [.tennis, .volleyball], priceFrom: 100, priceTo: 3000, currency: .USD)
        let campNou = Place(name: "Camp Nou", type: .stadium, contry: .Spain, maxSpectatorsCount: 99354, typeSport: [.football], priceFrom: 60, priceTo: 2500, currency: .EUR)
        let gameWeb = OnlinePlace(urlAdress: "www.game.com", language: [.English], name: "Game.com", type: .internet, contry: .UnitedStates, maxSpectatorsCount: 1000, typeSport: [.cybersport], priceFrom: 100, priceTo: 1000, currency: .USD)
        
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
        
        // Events date
        let dateFirstEvent = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 28, hour: 18, minute: 0))!
        let dateSecondEvent = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 15, hour: 12, minute: 30))!
        let dateThirdEvent = Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 5, hour: 20, minute: 45))!
        let dateFourthEvent = Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 8, hour: 20, minute: 0))!
        
        // Events
        let firstEvent = TeamSportEvent(teams: [manCity, barcelona], typeOfSport: .football, title: "Battle at the Etihad: Man City Hosts Barcelona", description: "Get ready for an epic encounter as Manchester City and Barcelona, two football powerhouses, lock horns in a thrilling showdown. Witness top-class football, skillful plays, and intense competition in this highly anticipated match at the Etihad Stadium. Don't miss the chance to experience the magic on the pitch!", date: dateFirstEvent, place: campNou, currency: .EUR, iconName: "EventFirst")
        
        let secondEvent = TeamSportEvent(teams: [psg, realMadrid], typeOfSport: .football, title: "Battle of Giants: PSG vs. Real Madrid Showdown", description: "Get ready for a football spectacle as Paris Saint-Germain and Real Madrid, two of the biggest names in European football, collide in a thrilling showdown. Join us for an unforgettable night of skill, passion, and drama as these football titans battle it out on the pitch. Don't miss a moment of the action!", date: dateSecondEvent, place: donbassArena, currency: .UAH, iconName: "EventSecond")
        
        let thirdEvent = TeamSportEvent(teams: [navi, virtuspro], typeOfSport: .cybersport, title: "Legends Collide: Na'Vi vs. Virtus.pro in a Thrilling Encounter", description: "Legends of the esports world collide as Na'Vi and Virtus.pro face off in a match that promises to redefine competitive gaming. Experience the adrenaline, the precision, and the sheer excitement as these esports giants showcase their skills. Don't miss the chance to witness gaming greatness live!", date: dateThirdEvent, place: gameWeb, currency: .USD, iconName: "EventThird")
        
        let fourthEvent = DoublesSportEvent(athletes: [djokovic, nadal], typeOfSport: .tennis, title: "Tennis Excellence: Djokovic and Nadal Face Off for Glory", description: "The net is set, and the stage is ready for a tennis showdown like no other. Djokovic and Nadal, two giants of the game, face off in a battle that will leave fans on the edge of their seats. Join us for a night of tennis brilliance, where skill, determination, and a quest for victory take center stage. This is tennis at its finest!", date: dateFourthEvent, place: arturAsheStadium, currency: .USD, iconName: "EventFourth")
        
        events = [firstEvent, secondEvent, thirdEvent, fourthEvent].sorted { $0.date < $1.date }
        
    }
    
    private func createEvent(participant: [Participant], typeOfSport: TypeOfSport, title: String, place: Place, description: String, iconName: String) -> Event? {
        
        switch participant {
            
        case let participant_ as [Team]:
            let text = "\(description). The event type of \(typeOfSport.rawValue) betwen \(participant_.enumerated().map( { "\($1.name)"}).joined(separator: " - ")) will be held on \(Date()) at \(place.name), the price of participation in the event is from \(place.priceFrom) \(place.currency) to \(place.priceTo) \(place.currency)."
            let event = TeamSportEvent(teams: participant_, typeOfSport: typeOfSport, title: title, description: text, date: Date(), place: place, currency: place.currency, iconName: iconName)
            
            return event
            
        case let participant_ as [Athlete]:
            let text = "\(description). The event type of \(typeOfSport.rawValue) betwen \(participant_.enumerated().map( { "\($1.firstName) \($1.lastName)"}).joined(separator: " - ")) will be held on \(Date()) at \(place.name), the price of participation in the event is from \(place.priceFrom) to \(place.priceTo) \(place.currency)."
            let event = DoublesSportEvent(athletes: participant_, typeOfSport: typeOfSport, title: title, description: text, date: Date(), place: place, currency: place.currency, iconName: iconName)
            
            return event
            
        default:
            return nil
        }
    }
}
