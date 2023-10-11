////
////  MainTableVC.swift
////  SportEventApp
////
////  Created by Nikita Melnikov on 03.09.2023.
////
//
//import Foundation
//import UIKit
//
//class MainTableVC: UIViewController {
//    
//    var athlete: Athlete?
//    var events: [Event]?
//    
//    private let liveScoreId = "liveScoreId"
//    private let sportsTVCId = "sportsTVC"
//    private let eventTypeTVCId = "eventTypeId"
//    private let eventsHeaderTVCId = "eventsHeaderTVCId"
//    private let eventTVCId = "eventTVCId"
//    var filterTypes: [TypeOfSport] = []
//    
//    @IBOutlet weak var tableViev: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableViev.delegate = self
//        tableViev.dataSource = self
//        tableViev.register(UINib(nibName: "LiveScoreTVC", bundle: nil), forCellReuseIdentifier: liveScoreId)
//        tableViev.register(UINib(nibName: "EventTypeTVC", bundle: nil), forCellReuseIdentifier: eventTypeTVCId)
//        tableViev.register(UINib(nibName: "EventsSectionCustomHeaderTVC", bundle: nil), forCellReuseIdentifier: eventsHeaderTVCId)
//        tableViev.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: eventTVCId)
//        
//        navigationController?.navigationBar.isHidden = true
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        
//        createTestData()
//        
//    }
//    
//    @IBAction func PlayerInfoBtn(_ sender: UIButton) {
//        if let athlete = athlete {
//            let vc = PlayerInfoVC()
//            navigationController?.pushViewController(vc, animated: true)
//            vc.athlete = athlete
//        }
//    }
//}
//
//extension MainTableVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        switch section {
//        case 0:
//            return 1
//        case 1:
//            return 1
//        case 2:
//            return 1
//        case 3:
//            return events?.count ?? 0
//        default:
//            return 0
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let liveScoreCell = tableView.dequeueReusableCell(withIdentifier: liveScoreId, for: indexPath) as! LiveScoreTVC
//        let eventTypeCollectionCell = tableView.dequeueReusableCell(withIdentifier: eventTypeTVCId, for: indexPath) as! EventTypeTVC
//        let eventSectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: eventsHeaderTVCId, for: indexPath) as! EventsSectionCustomHeaderTVC
//        let eventTVCCell = tableView.dequeueReusableCell(withIdentifier: eventTVCId, for: indexPath) as! EventTVC
//        
//        switch indexPath.section {
//            
//        case 0:
//            return liveScoreCell
//            
//        case 1:
//            tableView.layoutIfNeeded()
//            return eventTypeCollectionCell
//            
//        case 2:
//            return eventSectionHeaderCell
//            
//        case 3:
//            
//            if let event = events?[indexPath.row] as? TeamSportEvent {
//                eventTVCCell.firstTeamOrAtheleName?.text = event.teams.first?.name
//                eventTVCCell.secondTeamOrAthleteName?.text = event.teams.last?.name
//                eventTVCCell.firstTeamOrAthleteIcon?.image = event.teams.first?.icon
//                eventTVCCell.secondTeamOrAthleteIcon?.image = event.teams.last?.icon
//            }
//            
//            if let event = events?[indexPath.row] as? DoublesSportEvent {
//                eventTVCCell.firstTeamOrAtheleName?.text = event.athletes.first?.lastName
//                eventTVCCell.secondTeamOrAthleteName?.text = event.athletes.last?.lastName
//                eventTVCCell.firstTeamOrAthleteIcon?.image = event.athletes.first?.icon
//                eventTVCCell.secondTeamOrAthleteIcon?.image = event.athletes.last?.icon
//            }
//            
//            eventTVCCell.dateEventLabel.text = events?[indexPath.row].dateFormatter()
//            eventTVCCell.coutryEventLabel.text = events?[indexPath.row].place.contry
//            
//            return eventTVCCell
//            
//        default:
//            return UITableViewCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        if indexPath.section == 3 {
//            let vc = storyboard?.instantiateViewController(withIdentifier: "eventStoryboard") as! EventInfoVC
//            self.navigationController?.pushViewController(vc, animated: true)
//            vc.event = events?[indexPath.row]
//        }
//    }
//}
//
//extension MainTableVC {
//    
//    func createTestData() {
//        
//        // Events
////        let firstEvent = TeamSportEvent(teams: [manCity, barcelona], typeOfSport: .football, title: "Battle at the Etihad: Man City Hosts Barcelona", description: "Get ready for an epic encounter as Manchester City and Barcelona, two football powerhouses, lock horns in a thrilling showdown. Witness top-class football, skillful plays, and intense competition in this highly anticipated match at the Etihad Stadium. Don't miss the chance to experience the magic on the pitch!", date: dateFirstEvent, place: campNou, currency: .EUR, iconName: "EventFirst")
////
////        let secondEvent = TeamSportEvent(teams: [psg, realMadrid], typeOfSport: .football, title: "Battle of Giants: PSG vs. Real Madrid Showdown", description: "Get ready for a football spectacle as Paris Saint-Germain and Real Madrid, two of the biggest names in European football, collide in a thrilling showdown. Join us for an unforgettable night of skill, passion, and drama as these football titans battle it out on the pitch. Don't miss a moment of the action!", date: dateSecondEvent, place: donbassArena, currency: .UAH, iconName: "EventSecond")
////
////        let thirdEvent = TeamSportEvent(teams: [navi, virtuspro], typeOfSport: .cybersport, title: "Legends Collide: Na'Vi vs. Virtus.pro in a Thrilling Encounter", description: "Legends of the esports world collide as Na'Vi and Virtus.pro face off in a match that promises to redefine competitive gaming. Experience the adrenaline, the precision, and the sheer excitement as these esports giants showcase their skills. Don't miss the chance to witness gaming greatness live!", date: dateThirdEvent, place: gameWeb, currency: .USD, iconName: "EventThird")
////
////        let fourthEvent = DoublesSportEvent(athletes: [djokovic, nadal], typeOfSport: .tennis, title: "Tennis Excellence: Djokovic and Nadal Face Off for Glory", description: "The net is set, and the stage is ready for a tennis showdown like no other. Djokovic and Nadal, two giants of the game, face off in a battle that will leave fans on the edge of their seats. Join us for a night of tennis brilliance, where skill, determination, and a quest for victory take center stage. This is tennis at its finest!", date: dateFourthEvent, place: arturAsheStadium, currency: .USD, iconName: "EventFourth")
//        
////        events = [firstEvent, secondEvent, thirdEvent, fourthEvent].sorted { $0.date < $1.date }
//        
//    }
//}
