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
//        ------ отключение выделения ячеек

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
        let athleteLovoCell = tableView.dequeueReusableCell(withIdentifier: "AthleteLogoTVC") as! AthleteLogoTVC
        
        switch indexPath.section {
        case 0:
            return athleteLovoCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
}
