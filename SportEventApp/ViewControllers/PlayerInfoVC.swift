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
    }
    
    func setupTableView() {
        view.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AthleteLogoTVC.self, forCellReuseIdentifier: "AthleteLogoTVC")
        tableView.register(DiscussinTVC.self, forCellReuseIdentifier: "DiscussinTVC")
        tableView.register(NewsTVC.self, forCellReuseIdentifier: "NewsTVC")
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
        switch indexPath.section {
        case 0:
            return athleteLogoCell
        case 1:
            return discussCell
        case 2:
            return newsCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
