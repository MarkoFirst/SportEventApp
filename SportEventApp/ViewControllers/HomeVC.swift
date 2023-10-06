//
//  EventInfoVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.09.2023.
//

import Foundation
import RealmSwift
import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Open the local-only default realm
    let realm = try! Realm()
    
    var events: [Event] = []
    
    struct Cells {
        static let newsCellId = "newsCell"
        static let sportTCellId = "sportTCell"
        static let eventCellId = "eventCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = Array(realm.objects(Event.self))
        setupNavBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        events = Array(realm.objects(Event.self))
        tableView.reloadData()
    }
    
    
    // MARK: Open VC for creating an event
    
    @objc func createNewEvent() {
        let newEventVC = AddEventVC()
        
        newEventVC.modalPresentationStyle = .fullScreen
        present(newEventVC, animated: true, completion: nil)
    }
    
    // MARK: Go to the profile VC
    
    @objc func goToProfile () {
        navigationController?.pushViewController(ProfileVC(), animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
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
            guard let sportEvent = events[indexPath.row] as? Event else {
                return UITableViewCell()
            }
            
            // Setup first team label
            if let firstTeamLabel = eventCell.firstTeamLabel {
                firstTeamLabel.text = sportEvent.firstTeam 
            }
            
            // Setup second team label
            if let secondTeamLabel = eventCell.secondTeamLabel {
                secondTeamLabel.text = sportEvent.secondTeam 
            }
            
            // Setup event date
            if let eventDate = eventCell.eventDateLabel,
               let startDate = sportEvent.date {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "E, MMM d"
                let dateString = dateFormatter.string(from: startDate)
                eventDate.text = dateString
            } else {
                eventCell.eventDateLabel?.text = "No Date"
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
    
    // MARK: - UITableViewDelegate
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Allowing deletion of events only in the "Live Match" section
        return indexPath.section == 2
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Get the event to be deleted from the events array
            let eventToDelete = events[indexPath.row]
            
            // Delete the event from the database using CoreDataService
            do {
                try realm.write {
                    realm.delete(eventToDelete)
                }
            } catch {
                print("Error: \(error)")
            }
            
            // Remove the event from the array
            events.remove(at: indexPath.row)
            
            // Update the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension HomeVC {
    
    func setupTableView() {
        tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: Cells.newsCellId)
        tableView.register(UINib(nibName: "SportTVC", bundle: nil), forCellReuseIdentifier: Cells.sportTCellId)
        tableView.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: Cells.eventCellId)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupNavBar() {
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true;
        navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        
        // MARK: Configure shareButton
        
        let addEventButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        addEventButton.setImage(UIImage(named: "newEvent")?.withTintColor(UIColor.black), for: .normal)
        addEventButton.addTarget(self, action: #selector(createNewEvent), for: .touchUpInside)
        
        let addEventButtonItem = UIBarButtonItem(customView: addEventButton)
        
        // MARK: Configure bookmarkButton
        
        let bookmarkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        bookmarkButton.setImage(UIImage(named: "bell")?.withTintColor(UIColor.black), for: .normal)
        
        let bookmarkButtonItem = UIBarButtonItem(customView: bookmarkButton)
        
        // MARK: Configure userAvatar
        
        let userAvatar = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        userAvatar.setImage(UIImage(named: "avatar"), for: .normal)
        userAvatar.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        
        let userAvatarItem = UIBarButtonItem(customView: userAvatar)
        
        // MARK: Configure leftButtonItem
        
        let leftLabelItem = UIBarButtonItem(title: "Live score", style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItems = [userAvatarItem, bookmarkButtonItem, addEventButtonItem]
        navigationItem.leftBarButtonItem = leftLabelItem
    }
}
