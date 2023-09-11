//
//  MainTableVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 03.09.2023.
//

import Foundation
import UIKit


class MainTableVC: UIViewController {
    
    let liveScoreId = "liveScoreId"
    let sportsTVCId = "sportsTVC"
    let eventTypeTVCId = "eventTypeId"
    let eventsHeaderTVCId = "eventsHeaderTVCId"
    let eventTVCId = "eventTVCId"
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
            
            let firstEvent = createEvent(participant:
                                            [
                                                Team(name: "Manchester City", createYear: 1936, coach: "Patrick van Leeuwen", sport: .football, team:
                                                        [
                                                            Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, iconName: "defaultAthleteIcon")
                                                        ], country: .UnitedKingdom, iconName: "mcLogo"),
                                                Team(name: "Barcelona FC", createYear: 1912, coach: "Irina", sport: .football, team:
                                                        [
                                                            Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, iconName: "defaultAthleteIcon")
                                                        ], country: .Spain, iconName: "barcelonaLogo")
                                            ],
                                         date: "Mon, March 23, 21",
                                         typeOfSport: .football,
                                         title: "Championship. Event 1",
                                         place: Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Отбор", iconName: "EventFirst")
            
            let secondEvent = createEvent(participant:
                                            [
                                                Team(name: "Paris Saint-Germain", createYear: 1936, coach: "Kate", sport: .football, team:
                                                        [
                                                            Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, iconName: "defaultAthleteIcon")
                                                        ], country: .France, iconName: "psgLogo"),
                                                Team(name: "Real Madrid", createYear: 1912, coach: "Viktor", sport: .football, team:
                                                        [
                                                            Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, iconName: "defaultAthleteIcon")
                                                        ], country: .Spain, iconName: "realLogo")
                                            ],
                                          date: "Fri, Febr 24, 11",
                                          typeOfSport: .football,
                                          title: "World Cup. Event 2",
                                          place: Place(name: "Wembley", type: .stadium, contry: .UnitedKingdom, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH), description: "Final", iconName: "EventSecond")
            
            let thirdEvent = createEvent(participant:
                                            [
                                                Team(name: "Navi", createYear: 1936, coach: "Vasiliy", sport: .cybersport, team:
                                                        [
                                                            Athlete(firstName: "Ivan", lastName: "Ivanenko", age: 29, citizenship: .Afghanistan, birthplace: .Albania, gender: .male, sport: .football, number: 20, iconName: "defaultAthleteIcon"),
                                                        ], country: .Ukraine, iconName: "naviLogo"),
                                                Team(name: "Virtus pro", createYear: 1912, coach: "Sasha", sport: .cybersport, team:
                                                        [
                                                            Athlete(firstName: "Dima", lastName: "Dimov", age: 89, citizenship: .Ukraine, birthplace: .Ukraine, gender: .male, sport: .football, number: 18, iconName: "defaultAthleteIcon"),
                                                        ], country: .Other, iconName: "virtusproLogo")
                                            ],
                                         date: "Wed, Jan 24, 01",
                                         typeOfSport: .cybersport,
                                         title: "World Cyber Cup. Event 3",
                                         place: OnlinePlace(urlAdress: "www.game.com", language: [.English], name: "Game.com", type: .internet, contry: .UnitedStates, maxSpectatorsCount: 1000, typeSport: [.cybersport], priceFrom: 100, priceTo: 1000, currency: .USD),
                                         description: "1/4 Final", iconName: "EventThird")
            
            let fourthEvent = createEvent(participant:
                                            [
                                                Athlete(firstName: "Novak", lastName: "Djokovic", age: 29, citizenship: .Spain, birthplace: .Spain, gender: .male, sport: .tennis, number: nil, iconName: "djokovicLogo"),
                                                Athlete(firstName: "Rafael", lastName: "Nadal ", age: 40, citizenship: .Serbia, birthplace: .Serbia, gender: .male, sport: .tennis, number: nil, iconName: "nadaleLogo"),
                                            ],
                                          date: "Mon, Jul 24, 12",
                                          typeOfSport: .tennis,
                                          title: "Cup. Event 4",
                                          place: Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [.tennis, .volleyball], priceFrom: 100, priceTo: 3000, currency: .USD), description: "Friendly game", iconName: "EventFourth")
        }
    }

