//
//  MainTableVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 03.09.2023.
//

import Foundation
import UIKit
import RealmSwift

class MainTableVC: UIViewController {
    let realm = try! Realm()
    
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
        events = Array(realm.objects(TeamSportEvent.self))
        athlete = realm.objects(Athlete.self).filter( {$0.firstName == "Cristiano"} ).first
        
        
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
            eventTVCCell.coutryEventLabel.text = events?[indexPath.row].place?.contry
            
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
