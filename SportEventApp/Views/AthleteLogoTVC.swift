//
//  AthleteLogoTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 23.09.2023.
//

import Foundation
import UIKit
import SnapKit

class AthleteLogoTVC: UITableViewCell {
    
    let stackViewLabels = ["Age", "Games", "Goals"]
    let ageValue = 33
    let gamesValue = 14
    let goalsValue = 10
    let athleteTeamFlag = "juventusFlag"
    let athleteCountryFlag = "portugalFlag"
    let athleteLastName = "Ronaldo"
    let athleteNumber = 7
    let athleteRole = "FORWARD"
    
    var navigationController: UINavigationController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AthleteLogoTVC {
    
    func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let teamLogo = UIImageView()
        teamLogo.image = UIImage(named: "ronaldoLogo")
        teamLogo.contentMode = .scaleAspectFit
        contentView.addSubview(teamLogo)
        
        let athleteInfoStackView = UIStackView()
        athleteInfoStackView.axis = .horizontal
        athleteInfoStackView.distribution = .fillEqually
        athleteInfoStackView.spacing = 20
        athleteInfoStackView.translatesAutoresizingMaskIntoConstraints = true
        athleteInfoStackView.autoresizesSubviews = true
        contentView.addSubview(athleteInfoStackView)
        
        stackViewLabels.forEach {
            
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
            view.layer.cornerRadius = 20
            athleteInfoStackView.addArrangedSubview(view)
            
            let labelItem = UILabel()
            labelItem.text = $0
            labelItem.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            labelItem.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            labelItem.adjustsFontSizeToFitWidth = true
            view.addSubview(labelItem)
            
            let labelValue = UILabel()
            
            switch $0 {
            case "Age":
                labelValue.text = ageValue.description
            case "Games":
                labelValue.text = gamesValue.description
            case "Goals":
                labelValue.text = goalsValue.description
            default:
                return
            }
            
            labelValue.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            labelValue.font = UIFont.systemFont(ofSize: 56, weight: .bold)
            labelValue.textAlignment = .right
            labelValue.adjustsFontSizeToFitWidth = true
            view.addSubview(labelValue)
            
            view.snp.makeConstraints { $0.height.equalTo(view.snp.width).multipliedBy(1) }
            
            labelItem.snp.makeConstraints {
                $0.top.equalToSuperview().inset(12)
                $0.leading.equalToSuperview().inset(12)
                $0.height.equalTo(view.snp.height).multipliedBy(0.12)
            }
            
            labelValue.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(12)
                $0.trailing.equalToSuperview().inset(12)
                $0.width.equalTo(view.snp.width).multipliedBy(0.4)
                $0.height.equalTo(view.snp.height).multipliedBy(0.3)
            }
        }
        
        let navigationBackBtn = UIButton(type: .system)
        navigationBackBtn.setTitle("BACK", for: .normal)
        navigationBackBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navigationBackBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        navigationBackBtn.addTarget(self, action: #selector(tapBackBtn), for: .touchUpInside)
        contentView.addSubview(navigationBackBtn)
        
        let bookmarkBtn = UIButton(type: .system)
        bookmarkBtn.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        bookmarkBtn.layer.borderWidth = 1
        bookmarkBtn.layer.cornerRadius = 20
        bookmarkBtn.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
        bookmarkBtn.setImage(UIImage(named: "bookmark"), for: .normal)
        bookmarkBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        contentView.addSubview(bookmarkBtn)
        
        let shareBtn = UIButton(type: .system)
        shareBtn.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        shareBtn.layer.borderWidth = 1
        shareBtn.layer.cornerRadius = 20
        shareBtn.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
        shareBtn.setImage(UIImage(named: "shareArrow"), for: .normal)
        shareBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        contentView.addSubview(shareBtn)
        
        let countryFlagLogo = UIImageView()
        countryFlagLogo.image = UIImage(named: athleteCountryFlag)
        countryFlagLogo.layer.cornerRadius = 25
        countryFlagLogo.clipsToBounds = true
        contentView.addSubview(countryFlagLogo)
        
        let teamFlagLogo = UIImageView()
        teamFlagLogo.image = UIImage(named: athleteTeamFlag)
        teamFlagLogo.layer.cornerRadius = 25
        teamFlagLogo.clipsToBounds = true
        contentView.addSubview(teamFlagLogo)
        
        let playerNameLabel = UILabel()
        playerNameLabel.text = athleteLastName
        playerNameLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        contentView.addSubview(playerNameLabel)
        
        let uniformLogoView = UIView()
        contentView.addSubview(uniformLogoView)
        
        let uniformLogo = UIImageView()
        uniformLogo.image = UIImage(named: "uniformLogo")
        uniformLogoView.addSubview(uniformLogo)
        
        let athleteNumberLabel = UILabel()
        athleteNumberLabel.text = athleteNumber.description
        athleteNumberLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        athleteNumberLabel.adjustsFontSizeToFitWidth = true
        athleteNumberLabel.textAlignment = .center
        athleteNumberLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        uniformLogoView.addSubview(athleteNumberLabel)
        
        let athleteRoleLabel = UILabel()
        athleteRoleLabel.text = athleteRole
        athleteRoleLabel.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        athleteRoleLabel.adjustsFontSizeToFitWidth = true
        athleteRoleLabel.textAlignment = .center
        athleteRoleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(athleteRoleLabel)
        
        teamLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(teamLogo.snp.width).multipliedBy(1)
        }
        
        athleteInfoStackView.snp.makeConstraints {
            $0.top.equalTo(teamLogo.snp.bottom).inset(50)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
        
        navigationBackBtn.snp.makeConstraints {
            $0.top.equalTo(teamLogo.snp.top)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bookmarkBtn.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalTo(navigationBackBtn.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        shareBtn.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalTo(navigationBackBtn.snp.centerY)
            $0.trailing.equalTo(bookmarkBtn.snp.leading).inset(-16)
        }
        
        teamFlagLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(navigationBackBtn.snp.bottom).inset(-40)
            $0.height.width.equalTo(50)
        }
        
        countryFlagLogo.snp.makeConstraints {
            $0.top.equalTo(navigationBackBtn.snp.bottom).inset(-40)
            $0.leading.equalTo(teamFlagLogo.snp.trailing).inset(16)
            $0.height.width.equalTo(50)
        }
        
        playerNameLabel.snp.makeConstraints {
            $0.top.equalTo(teamFlagLogo.snp.bottom).inset(-4)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            $0.leading.equalToSuperview().inset(16)
        }
        
        uniformLogoView.snp.makeConstraints {
            $0.bottom.equalTo(athleteInfoStackView.snp.top).inset(-24)
            $0.height.width.equalTo(teamLogo.snp.width).multipliedBy(0.12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        uniformLogo.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        athleteNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(uniformLogoView.snp.centerY)
            $0.centerX.equalTo(uniformLogoView.snp.centerX)
            $0.edges.equalTo(uniformLogoView).inset(16)
        }
        
        athleteRoleLabel.snp.makeConstraints {
            $0.centerY.equalTo(uniformLogoView.snp.centerY)
            $0.leading.equalTo(uniformLogoView.snp.trailing)
        }
    }
    
    @objc private func tapBackBtn() {
        navigationController?.popViewController(animated: true)
    }
}
