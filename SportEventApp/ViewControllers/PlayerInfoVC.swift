//
//  PlayerInfoVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 20.09.2023.
//

import Foundation
import UIKit
import SnapKit

class PlayerInfoVC: UIViewController {
    
var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setupTableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setupTableView() {
        
        view.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AthleteLogoTVC.self, forCellReuseIdentifier: "AthleteLogoTVC")
        tableView.register(DiscussinTVC.self, forCellReuseIdentifier: "DiscussinTVC")
        tableView.register(NewsTVC.self, forCellReuseIdentifier: "NewsTVC")
        tableView.register(AthleteStatsTVC.self, forCellReuseIdentifier: "AthleteStatsTVC")
        tableView.register(TrophiesTVC.self, forCellReuseIdentifier: "TrophiesTVC")
        tableView.register(HistoryTVC.self, forCellReuseIdentifier: "HistoryTVC")
        
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PlayerInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let athleteLogoCell = tableView.dequeueReusableCell(withIdentifier: "AthleteLogoTVC") as! AthleteLogoTVC
        let discussCell = tableView.dequeueReusableCell(withIdentifier: "DiscussinTVC") as! DiscussinTVC
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTVC") as! NewsTVC
        let athleteStatsCell = tableView.dequeueReusableCell(withIdentifier: "AthleteStatsTVC") as! AthleteStatsTVC
        let trophiesCell = tableView.dequeueReusableCell(withIdentifier: "TrophiesTVC") as! TrophiesTVC
        let historyCell = tableView.dequeueReusableCell(withIdentifier: "HistoryTVC") as! HistoryTVC
        
        switch indexPath.section {
        case 0:
            athleteLogoCell.navigationController = navigationController
            return athleteLogoCell
        case 1:
            return discussCell
        case 2:
            return newsCell
        case 3:
            return athleteStatsCell
        case 4:
            return trophiesCell
        case 5:
            return historyCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
