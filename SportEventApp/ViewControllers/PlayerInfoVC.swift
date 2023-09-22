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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension PlayerInfoVC {
    func setupView(){
        view.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let athleteLogoView = UIView()
        athleteLogoView.backgroundColor = .clear
        
        view.addSubview(athleteLogoView)
        athleteLogoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        
        let teamLogo = UIImageView()
        teamLogo.image = UIImage(named: "ronaldoLogo")
        athleteLogoView.addSubview(teamLogo)
        
        teamLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(athleteLogoView.snp.leading).inset(0)
            $0.trailing.equalTo(athleteLogoView.snp.trailing).inset(0)
            $0.height.equalTo(teamLogo.snp.width).multipliedBy(1)
        }
        
        let athleteInfoStackView = UIStackView()
        athleteInfoStackView.axis = .horizontal
        athleteInfoStackView.distribution = .fillEqually
        athleteInfoStackView.spacing = 20
        athleteInfoStackView.translatesAutoresizingMaskIntoConstraints = true
        athleteInfoStackView.autoresizesSubviews = true
        athleteLogoView.addSubview(athleteInfoStackView)
        
        athleteInfoStackView.snp.makeConstraints {
            $0.top.equalTo(teamLogo.snp.bottom).inset(50)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        
        
        let ageInfo = UIView()
        ageInfo.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        ageInfo.layer.cornerRadius = 20
        athleteInfoStackView.addArrangedSubview(ageInfo)
        ageInfo.snp.makeConstraints {
            $0.height.equalTo(ageInfo.snp.width).multipliedBy(1)
        }
        
        let ageLable = UILabel()
        ageLable.text = "Age"
        ageLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        ageLable.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        ageLable.adjustsFontSizeToFitWidth = true
        ageInfo.addSubview(ageLable)
        ageLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo(ageInfo.snp.width).multipliedBy(0.2)
            $0.height.equalTo(ageInfo.snp.height).multipliedBy(0.2)
        }
        
        let ageValueLable = UILabel()
        // ------------------------------------------------------------------------------------------> Set value
        ageValueLable.text = "33"
        // ------------------------------------------------------------------------------------------> Set value
        ageValueLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        ageValueLable.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        ageValueLable.textAlignment = .right
        ageValueLable.adjustsFontSizeToFitWidth = true
        ageInfo.addSubview(ageValueLable)
        ageValueLable.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(ageInfo.snp.width).multipliedBy(0.4)
            $0.height.equalTo(ageInfo.snp.height).multipliedBy(0.3)
        }
        
        let gamesInfo = UIView()
        gamesInfo.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        gamesInfo.layer.cornerRadius = 20
        athleteInfoStackView.addArrangedSubview(gamesInfo)
        gamesInfo.snp.makeConstraints {
            $0.height.equalTo(gamesInfo.snp.width).multipliedBy(1)
        }
        
        let gamesLable = UILabel()
        gamesLable.text = "Games"
        gamesLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        gamesLable.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        gamesLable.adjustsFontSizeToFitWidth = true
        gamesInfo.addSubview(gamesLable)
        gamesLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo(gamesInfo.snp.width).multipliedBy(0.35)
            $0.height.equalTo(gamesInfo.snp.height).multipliedBy(0.2)
        }
        
        let gamesValueLable = UILabel()
        // ------------------------------------------------------------------------------------------> Set value
        gamesValueLable.text = "14"
        // ------------------------------------------------------------------------------------------> Set value
        gamesValueLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        gamesValueLable.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        gamesValueLable.textAlignment = .right
        gamesValueLable.adjustsFontSizeToFitWidth = true
        gamesInfo.addSubview(gamesValueLable)
        gamesValueLable.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(gamesInfo.snp.width).multipliedBy(0.4)
            $0.height.equalTo(gamesInfo.snp.height).multipliedBy(0.3)
        }
        
        let goalsInfo = UIView()
        goalsInfo.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        goalsInfo.layer.cornerRadius = 20
        athleteInfoStackView.addArrangedSubview(goalsInfo)
        goalsInfo.snp.makeConstraints {
            $0.height.equalTo(goalsInfo.snp.width).multipliedBy(1)
        }
        
        let goalsLable = UILabel()
        goalsLable.text = "Goals"
        goalsLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        goalsLable.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        goalsLable.adjustsFontSizeToFitWidth = true
        goalsInfo.addSubview(goalsLable)
        goalsLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo(goalsInfo.snp.width).multipliedBy(0.3)
            $0.height.equalTo(goalsInfo.snp.height).multipliedBy(0.2)
        }
        
        let goalsValueLable = UILabel()
        // ------------------------------------------------------------------------------------------> Set value
        goalsValueLable.text = "10"
        // ------------------------------------------------------------------------------------------> Set value
        goalsValueLable.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        goalsValueLable.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        goalsValueLable.textAlignment = .right
        goalsValueLable.adjustsFontSizeToFitWidth = true
        goalsInfo.addSubview(goalsValueLable)
        goalsValueLable.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(goalsInfo.snp.width).multipliedBy(0.4)
            $0.height.equalTo(goalsInfo.snp.height).multipliedBy(0.3)
        }
        
        let navigationView = UIView()
        navigationView.backgroundColor = .clear
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.top.equalTo(athleteLogoView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        
        var backBtnConfiguration = UIButton.Configuration.plain()
        backBtnConfiguration.title = "BACK"
        backBtnConfiguration.image = UIImage(systemName: "chevron.left")
        backBtnConfiguration.imagePadding = 16
        backBtnConfiguration.baseForegroundColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1)
        
        let navigationBackBtn = UIButton(configuration: backBtnConfiguration)
        navigationView.addSubview(navigationBackBtn)
        navigationBackBtn.snp.makeConstraints {
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.leading.equalTo(navigationView.snp.leading).inset(16)
        }
    
        let bookmarkBtn = UIButton(type: .system)
        bookmarkBtn.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 0.8)
        bookmarkBtn.layer.borderWidth = 2
        bookmarkBtn.layer.cornerRadius = 25
        bookmarkBtn.layer.borderColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1).cgColor
        bookmarkBtn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkBtn.tintColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1)

        navigationView.addSubview(bookmarkBtn)
        bookmarkBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.trailing.equalTo(navigationView.snp.trailing).inset(16)
        }
        
        let shareBtn = UIButton(type: .system)
        shareBtn.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 0.8)
        shareBtn.layer.borderWidth = 2
        shareBtn.layer.cornerRadius = 25
        shareBtn.layer.borderColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1).cgColor
        shareBtn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        shareBtn.tintColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1)
        navigationView.addSubview(shareBtn)
        
        shareBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.trailing.equalTo(bookmarkBtn.snp.leading).inset(-16)
        }
        
        let countryFlagLogo = UIImageView()
        countryFlagLogo.image = UIImage(named: "portugalFlag")
        countryFlagLogo.layer.cornerRadius = 25
        countryFlagLogo.clipsToBounds = true
        athleteLogoView.addSubview(countryFlagLogo)
        
        countryFlagLogo.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).inset(-12)
            $0.leading.equalTo(athleteLogoView.snp.leading).inset(60)
            $0.height.width.equalTo(50)
        }
        
        
        let teamFlagLogo = UIImageView()
        teamFlagLogo.image = UIImage(named: "juventusFlag")
        teamFlagLogo.layer.cornerRadius = 25
        teamFlagLogo.clipsToBounds = true
        athleteLogoView.addSubview(teamFlagLogo)
        
        teamFlagLogo.snp.makeConstraints {
            $0.trailing.equalTo(countryFlagLogo.snp.leading).inset(16)
            $0.centerY.equalTo(countryFlagLogo.snp.centerY).inset(0)
            $0.height.width.equalTo(50)
        }
        
        let playerNameLabel = UILabel()
        playerNameLabel.text = "Ronaldo"
        playerNameLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        athleteLogoView.addSubview(playerNameLabel)
        playerNameLabel.snp.makeConstraints {
            $0.top.equalTo(teamFlagLogo.snp.bottom).inset(0)
            $0.width.equalTo(athleteLogoView.snp.width).multipliedBy(0.5)
            $0.leading.equalToSuperview().inset(12)
        }
        
        let uniformLogoView = UIView()
        athleteLogoView.addSubview(uniformLogoView)
        
        uniformLogoView.snp.makeConstraints {
            $0.bottom.equalTo(athleteInfoStackView.snp.top).inset(-24)
            $0.height.width.equalTo(athleteLogoView.snp.width).multipliedBy(0.15)
            $0.leading.equalToSuperview().inset(12)
        }
       
        let uniformLogo = UIImageView()
        uniformLogo.image = UIImage(named: "uniformLogo")
        uniformLogoView.addSubview(uniformLogo)
        uniformLogo.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let athleteNumber = UILabel()
        athleteNumber.text = "77"
        athleteNumber.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        athleteNumber.adjustsFontSizeToFitWidth = true
        athleteNumber.textAlignment = .center
        athleteNumber.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        uniformLogoView.addSubview(athleteNumber)
        athleteNumber.snp.makeConstraints {
            $0.centerY.equalTo(uniformLogoView.snp.centerY)
            $0.centerX.equalTo(uniformLogoView.snp.centerX)
            $0.edges.equalTo(uniformLogoView).inset(16)
        }
        
        
    }
}
