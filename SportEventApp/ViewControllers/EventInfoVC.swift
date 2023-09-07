//
//  EventInfoVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 04.09.2023.
//

import Foundation
import UIKit

class EventInfoVC: UIViewController {
    var event: Event?
    let titleId = "titleId"
    let iconId = "iconId"
    let descriptionId = "descriptionId"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EventInfoTitleTVC", bundle: nil), forCellReuseIdentifier: titleId)
        tableView.register(UINib(nibName: "EventInfoIconTVC", bundle: nil), forCellReuseIdentifier: iconId)
        tableView.register(UINib(nibName: "EventInfoDescriptionCell", bundle: nil), forCellReuseIdentifier: descriptionId)
        navigationController?.navigationBar.isHidden = true
        
        if let event_ = event {
            event = event_
        } else {
            return
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension EventInfoVC: UITableViewDelegate, UITableViewDataSource {
   
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
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleCell = tableView.dequeueReusableCell(withIdentifier: titleId, for: indexPath) as! EventInfoTitleTVC
        let iconCell = tableView.dequeueReusableCell(withIdentifier: iconId, for: indexPath) as! EventInfoIconTVC
        let descriptionCell = tableView.dequeueReusableCell(withIdentifier: descriptionId, for: indexPath) as! EventInfoDescriptionCell
        switch indexPath.section {
        case 0:
            titleCell.eventTitle.text = event?.title
            titleCell.eventDate.text = event?.date
            if let event_ = event as? TeamSportEvent {
                titleCell.eventType.text = event_.typeOfSport.rawValue
            } else if let event_ = event as? DoublesSportEvent {
                titleCell.eventType.text = event_.typeOfSport.rawValue
            }
            return titleCell
        case 1:
            iconCell.eventIcon.image = event?.icon
            return iconCell
        case 2:
            descriptionCell.eventDescription.text = event?.description
            return descriptionCell
        default:
            return UITableViewCell()
        }
    }


}
