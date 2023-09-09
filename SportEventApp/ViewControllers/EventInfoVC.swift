//
//  EventInfoVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 08.09.2023.
//

import Foundation
import UIKit



class EventInfoVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    var event: Event?
    
    struct Cells {
        static let eventHeaderId = "eventHeaderCell"
        static let eventImageId = "eventImageCell"
        static let eventDescId = "eventDescCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        tableView.register(UINib(nibName: "EventHeaderTVC", bundle: nil), forCellReuseIdentifier: Cells.eventHeaderId)
        tableView.register(UINib(nibName: "EventImageTVC", bundle: nil), forCellReuseIdentifier: Cells.eventImageId)
        tableView.register(UINib(nibName: "EventDescTVC", bundle: nil), forCellReuseIdentifier: Cells.eventDescId)
        
        tableView.dataSource = self
        tableView.delegate = self
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
        let headerCell = tableView.dequeueReusableCell(withIdentifier: Cells.eventHeaderId) as! EventHeaderTVC
        let imageCell = tableView.dequeueReusableCell(withIdentifier: Cells.eventImageId) as! EventImageTVC
        let descCell = tableView.dequeueReusableCell(withIdentifier: Cells.eventDescId) as! EventDescTVC
        
        switch indexPath.section {
        case 0:
            headerCell.headerTitleLabel.text = event?.title
            headerCell.headerDateLabel.text = event?.dateFullString

            if let event = event as? SportEvent {
                headerCell.headerSportLabel.text = event.sport.name
            }
            
            return headerCell
        case 1:
            imageCell.headerImage.image = event?.setEventCover
            return imageCell
        case 2:
            descCell.headerDescTextView.text = event?.description
            return descCell
        default:
            return UITableViewCell()
        }
    }
    
}
