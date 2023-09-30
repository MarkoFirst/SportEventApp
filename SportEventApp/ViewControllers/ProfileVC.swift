//
//  ProfileVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 12.09.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    private var tableView = UITableView()
    private var athletes: [Athlete] = []
    
    struct Cells {
        static let athleteInfoCellId = "AthleteInfoTVC"
        static let discussionCellId = "DiscussionTVC"
        static let statsCellId = "StatsTVC"
        static let trophyCellId = "TrophyTVC"
        static let historyCellId = "HistoryTVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        athletes = fetchData()
        configureNavBar()
        configureTableView()
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavBar() {

        navigationController?.navigationBar.isHidden = false
        
        let shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        shareButton.setImage(UIImage(named: "share")?.withTintColor(UIColor.white), for: .normal)
        shareButton.layer.cornerRadius = 18
        shareButton.layer.borderWidth = 1
        shareButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22).cgColor
        shareButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let shareButtonItem = UIBarButtonItem(customView: shareButton)
        
        let bookmarkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        bookmarkButton.setImage(UIImage(named: "bookmark")?.withTintColor(UIColor.white), for: .normal)
        bookmarkButton.layer.cornerRadius = 18
        bookmarkButton.layer.borderWidth = 1
        bookmarkButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22).cgColor
        bookmarkButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let bookmarkButtonItem = UIBarButtonItem(customView: bookmarkButton)
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        backButton.setImage(UIImage(named: "back")?.withTintColor(UIColor.white), for: .normal)
        backButton.layer.cornerRadius = 18
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22).cgColor
        backButton.addTarget(navigationController, action: #selector(UINavigationController.popViewController(animated:)), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.rightBarButtonItems = [bookmarkButtonItem, shareButtonItem]
        
        
        navigationItem.leftBarButtonItem = backButtonItem
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    // MARK: Configure TableView
    
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegates()
        
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        tableView.register(AthleteInfoTVC.self, forCellReuseIdentifier: Cells.athleteInfoCellId)
        tableView.register(DiscussionTVC.self, forCellReuseIdentifier: Cells.discussionCellId)
        tableView.register(StatsTVC.self, forCellReuseIdentifier: Cells.statsCellId)
        tableView.register(TrophyTVC.self, forCellReuseIdentifier: Cells.trophyCellId)
        tableView.register(HistoryTVC.self, forCellReuseIdentifier: Cells.historyCellId)
        
        setTableViewConstraints()
    }
    
    func setTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func buttonTapped() {
        print("You tap on button")
    }
}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3, 4:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let athleteInfoCell = tableView.dequeueReusableCell(withIdentifier: Cells.athleteInfoCellId) as! AthleteInfoTVC
        let discussionCell = tableView.dequeueReusableCell(withIdentifier: Cells.discussionCellId) as! DiscussionTVC
        let statsCell = tableView.dequeueReusableCell(withIdentifier: Cells.statsCellId) as! StatsTVC
        let trophyCell = tableView.dequeueReusableCell(withIdentifier: Cells.trophyCellId) as! TrophyTVC
        let historyCell = tableView.dequeueReusableCell(withIdentifier: Cells.historyCellId) as! HistoryTVC
        
        let athlete = athletes[indexPath.row]
        athleteInfoCell.configure(athlete: athlete)
        
        
        switch indexPath.section {
        case 0:
            athleteInfoCell.selectionStyle = .none
            
            return athleteInfoCell
        case 1:
            
            // MARK: Setup blur effect for cell
            
            discussionCell.selectionStyle = .none
         
            return discussionCell
        case 2:
            statsCell.selectionStyle = .none
            statsCell.configure(sectionTitle: "STATS")
            
            return statsCell
        case 3:
            trophyCell.selectionStyle = .none
            trophyCell.configure(sectionTitle: "TROPHIES")
            
            return trophyCell
        case 4:
            historyCell.selectionStyle = .none
            historyCell.configure(sectionTitle: "HISTORY")
            
            
            return historyCell
        default:
            return UITableViewCell()
        }
    }
}

extension ProfileVC {
    
    private func fetchData() -> [Athlete] {
        
        let athlete1 = Athlete(firstName: "Zach", lastName: "LaVine", age: 26, country: "USA", gender: .male, athleteImageName: "lavine", goals: 25, games: 60)
        let athlete2 = Athlete(firstName: "Nikola", lastName: "Vučević", age: 30, country: "Montenegro", gender: .male, athleteImageName: "lavine", goals: 18, games: 50)
        let athlete3 = Athlete(firstName: "Coby", lastName: "White", age: 21, country: "USA", gender: .male, athleteImageName: "lavine", goals: 12, games: 55)
        let athlete4 = Athlete(firstName: "Patrick", lastName: "Williams", age: 19, country: "USA", gender: .male, athleteImageName: "lavine", goals: 8, games: 48)
        let athlete5 = Athlete(firstName: "Lonzo", lastName: "Ball", age: 23, country: "USA", gender: .male, athleteImageName: "lavine", goals: 10, games: 51)
        let athlete6 = Athlete(firstName: "Alex", lastName: "Caruso", age: 27, country: "USA", gender: .male, athleteImageName: "lavine", goals: 6, games: 45)
        let athlete7 = Athlete(firstName: "Derrick", lastName: "Jones Jr.", age: 24, country: "USA", gender: .male, athleteImageName: "lavine", goals: 7, games: 42)
        let athlete8 = Athlete(firstName: "Troy", lastName: "Brown Jr.", age: 21, country: "USA", gender: .male, athleteImageName: "lavine", goals: 4, games: 39)
        
        return [athlete1, athlete2, athlete3, athlete4, athlete5, athlete6, athlete7, athlete8]
    }
}
