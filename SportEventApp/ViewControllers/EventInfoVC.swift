//
//  EventInfoVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.09.2023.
//

import Foundation
import UIKit

class EventInfoVC: UITableViewController {
    private let newsCellId = "newsCell"
    private let sportTCellId = "sportTCell"
    private let sportCCellId = "sportCCell"
    private let eventCellId = "eventCell"
    
    private var nameList = ["Kate", "Dima", "Ernest", "Max"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.register(NewsTVC.self, forCellReuseIdentifier: newsCellId)
        
        tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: newsCellId)
        tableView.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: eventCellId)
        
        // Реєстрація кастомної CollectionViewCell
            let collectionViewNib = UINib(nibName: "SportCVC", bundle: nil)
            tableView.register(collectionViewNib, forCellReuseIdentifier: sportTCellId)

        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return nameList.count
        case 2:
            return nameList.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // Вставте кастомну комірку newsCell у першу секцію
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: newsCellId, for: indexPath) as? NewsTVC else {
                return UITableViewCell()
            }
            
            if let coverImage = newsCell.coverImage {
                coverImage.image = UIImage(named: "target")
            }
            
            return newsCell
        } else if indexPath.section == 1 {
            // Вставте кастомну комірку eventCell у другу секцію
            guard let eventCell = tableView.dequeueReusableCell(withIdentifier: eventCellId, for: indexPath) as? EventTVC else {
                return UITableViewCell()
            }
            
            // Виконайте налаштування для eventCell тут
            
            return eventCell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0, 1:
            return ""
        case 2:
            return "Live Match"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 252
        case 1:
            return 81
        default:
            return 0
        }
    }
}


