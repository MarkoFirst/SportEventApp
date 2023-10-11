//
//  PlayerInfoVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 20.09.2023.
//

//import Foundation
//import UIKit
//import SnapKit
//
//
//class PlayerInfoVC: UIViewController {
//    
//    var athlete: Athlete?
//    
//    var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationController?.navigationBar.isHidden = true
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        setupTableView()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = .clear
//        tableView.allowsSelection = false
//        tableView.showsVerticalScrollIndicator = false
//        
//        if let athlete_ = athlete { athlete = athlete_ }
//    }
//    
//    private func setupTableView() {
//        
//        view.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
//        
//        tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(AthleteLogoTVC.self, forCellReuseIdentifier: "AthleteLogoTVC")
//        tableView.register(DiscussinTVC.self, forCellReuseIdentifier: "DiscussinTVC")
//        tableView.register(NewsTVC.self, forCellReuseIdentifier: "NewsTVC")
//        tableView.register(AthleteStatsTVC.self, forCellReuseIdentifier: "AthleteStatsTVC")
//        tableView.register(TrophiesTVC.self, forCellReuseIdentifier: "TrophiesTVC")
//        tableView.register(HistoryTVC.self, forCellReuseIdentifier: "HistoryTVC")
//        
//        view.addSubview(tableView)
//        
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//}
//
//extension PlayerInfoVC: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 6
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let athleteLogoCell = tableView.dequeueReusableCell(withIdentifier: "AthleteLogoTVC") as! AthleteLogoTVC
//        let discussCell = tableView.dequeueReusableCell(withIdentifier: "DiscussinTVC") as! DiscussinTVC
//        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTVC") as! NewsTVC
//        let athleteStatsCell = tableView.dequeueReusableCell(withIdentifier: "AthleteStatsTVC") as! AthleteStatsTVC
//        let trophiesCell = tableView.dequeueReusableCell(withIdentifier: "TrophiesTVC") as! TrophiesTVC
//        let historyCell = tableView.dequeueReusableCell(withIdentifier: "HistoryTVC") as! HistoryTVC
//        
//        switch indexPath.section {
//            
//        case 0:
//            athleteLogoCell.navigationController = navigationController
//            athleteLogoCell.teamLogo.image = athlete?.atheleBigImage
//            athleteLogoCell.setupAthleteLogoCell(age: athlete?.age ?? 0, games: athlete?.gamesValue ?? 0, goals: athlete?.goalsValue ?? 0)
//            athleteLogoCell.countryFlagLogo.image = UIImage(named: athlete?.citizenship.rawValue ?? "")
//            athleteLogoCell.playerNameLabel.text = athlete?.lastName
//            athleteLogoCell.athleteNumberLabel.text = athlete?.number?.description
//            athleteLogoCell.teamFlagLogo.image = athlete?.athleteTeam?.icon
//            athleteLogoCell.athleteRoleLabel.text = athlete?.athleteRole
//            
//            return athleteLogoCell
//            
//        case 1:
//            return discussCell
//            
//        case 2:
//            newsCell.teamFlagLogo.image = athlete?.athleteTeam?.icon
//            newsCell.athleteImage.image = athlete?.icon
//            newsCell.typeNewsLabel.text = athlete?.typeOfSport.rawValue
//            newsCell.getNewsInfo(teamName: athlete?.athleteTeam?.name ?? "" , athleteLastName: athlete?.lastName ?? "")
//            
//            return newsCell
//            
//        case 3:
//            athleteStatsCell.percentShotOnTarget.image = UIImage(named: athleteStatsCell.percentImage(number: athlete?.shotOnTarget ?? 0, from: athlete?.allKicks ?? 0))
//            athleteStatsCell.percentGoalsScored.image = UIImage(named: athleteStatsCell.percentImage(number: athlete?.goalsScored ?? 0, from: athlete?.allKicks ?? 0))
//            athleteStatsCell.kickStatsLabel.text = athlete?.allKicks.description
//            athleteStatsCell.shotsOnTarget.text = athlete?.shotOnTarget?.description
//            athleteStatsCell.goalsScored.text = athlete?.goalsScored?.description
//            athleteStatsCell.foulsWonLabel.text = athlete?.foulsWon?.description
//            athleteStatsCell.foulsConceded.text = athlete?.foulsConceded?.description
//            athleteStatsCell.yellowCardsValue.text = athlete?.yellowCards?.description
//            athleteStatsCell.redCardsValue.text = athlete?.redCards?.description
//            
//            return athleteStatsCell
//            
//        case 4:
//            trophiesCell.athlete = athlete
//            return trophiesCell
//            
//        case 5:
//            if (athlete?.teams) != nil {
//                historyCell.setupAthleteHistory(teams: athlete!.teams!)
//            }
//            
//            return historyCell
//            
//        default:
//            return UITableViewCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
