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
    
    let athleteLogoView = UIView()
    let teamLogo = UIImageView()
    let athleteInfoStackView = UIStackView()
    let ageInfo = UIView()
    let ageLable = UILabel()
    let ageValueLable = UILabel()
    let gamesInfo = UIView()
    let gamesLable = UILabel()
    let gamesValueLable = UILabel()
    let goalsInfo = UIView()
    let goalsLable = UILabel()
    let goalsValueLable = UILabel()
    let navigationView = UIView()
    let navigationBackBtn = UIButton(type: .system)
    let bookmarkBtn = UIButton(type: .system)
    let shareBtn = UIButton(type: .system)
    let countryFlagLogo = UIImageView()
    let teamFlagLogo = UIImageView()
    let playerNameLabel = UILabel()
    let uniformLogoView = UIView()
    let uniformLogo = UIImageView()
    let athleteNumber = UILabel()
    let athleteRole = UILabel()
    
    let stackViewLabels = ["Age", "Games", "Goals"]
    let ageValue = 33
    let gamesValue = 14
    let goalsValue = 10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        teamLogo.image = UIImage(named: "ronaldoLogo")
        teamLogo.contentMode = .scaleAspectFit
        contentView.addSubview(teamLogo)
        
        teamLogo.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(teamLogo.snp.width).multipliedBy(1)
        }
        
        athleteInfoStackView.axis = .horizontal
        athleteInfoStackView.distribution = .fillEqually
        athleteInfoStackView.spacing = 20
        athleteInfoStackView.translatesAutoresizingMaskIntoConstraints = true
        athleteInfoStackView.autoresizesSubviews = true
        contentView.addSubview(athleteInfoStackView)
        
        athleteInfoStackView.snp.makeConstraints {
            $0.top.equalTo(teamLogo.snp.bottom).inset(50)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(0)
        }
        
        for item in stackViewLabels {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
            view.layer.cornerRadius = 20
            athleteInfoStackView.addArrangedSubview(view)
            view.snp.makeConstraints {
                $0.height.equalTo(view.snp.width).multipliedBy(1)
            }
            
            let labelItem = UILabel()
            labelItem.text = item
            labelItem.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            labelItem.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            labelItem.adjustsFontSizeToFitWidth = true
            view.addSubview(labelItem)
            labelItem.snp.makeConstraints {
                $0.top.equalToSuperview().inset(12)
                $0.leading.equalToSuperview().inset(12)
                $0.height.equalTo(view.snp.height).multipliedBy(0.12)
            }
            
            let labelValue = UILabel()
            switch item {
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
            labelValue.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(12)
                $0.trailing.equalToSuperview().inset(12)
                $0.width.equalTo(view.snp.width).multipliedBy(0.4)
                $0.height.equalTo(view.snp.height).multipliedBy(0.3)
            }
        }
        

        //        //    let navigationView = UIView()
        //        navigationView.backgroundColor = .clear
        //        contentView.addSubview(navigationView)
        //        navigationView.snp.makeConstraints {
        //            $0.height.equalTo(60)
        //            $0.top.equalTo(athleteLogoView.snp.top)
        //            $0.leading.trailing.equalToSuperview().inset(0)
        //        }
        //
                navigationBackBtn.setTitle("BACK", for: .normal)
                navigationBackBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
                navigationBackBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        navigationBackBtn.addTarget(self, action: #selector(tapBackBtn), for: .touchUpInside)
        contentView.addSubview(navigationBackBtn)
                navigationBackBtn.snp.makeConstraints {
                    $0.top.equalToSuperview().inset(0)
                    $0.leading.equalToSuperview().inset(16)
                }
        //
        //        //    let bookmarkBtn = UIButton(type: .system)
                bookmarkBtn.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
                bookmarkBtn.layer.borderWidth = 1
                bookmarkBtn.layer.cornerRadius = 20
                bookmarkBtn.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
                bookmarkBtn.setImage(UIImage(systemName: "bookmark"), for: .normal)
                bookmarkBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        bookmarkBtn.addTarget(self, action: #selector(tapBookmarkBtn), for: .touchUpInside)
        contentView.addSubview(bookmarkBtn)
                bookmarkBtn.snp.makeConstraints {
                    $0.height.equalTo(40)
                    $0.width.equalTo(40)
                    $0.centerY.equalTo(navigationBackBtn.snp.centerY)
                    $0.trailing.equalToSuperview().inset(16)
                }
        //
        //        //    let shareBtn = UIButton(type: .system)
                shareBtn.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
                shareBtn.layer.borderWidth = 1
                shareBtn.layer.cornerRadius = 20
                shareBtn.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
                shareBtn.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
                shareBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        contentView.addSubview(shareBtn)
        
                shareBtn.snp.makeConstraints {
                    $0.height.equalTo(40)
                    $0.width.equalTo(40)
                    $0.centerY.equalTo(navigationBackBtn.snp.centerY)
                    $0.trailing.equalTo(bookmarkBtn.snp.leading).inset(-16)
                }
        shareBtn.addTarget(self, action: #selector(tapShareBtn), for: .touchUpInside)
        //
        //        //    let countryFlagLogo = UIImageView()
        //        countryFlagLogo.image = UIImage(named: "portugalFlag")
        //        countryFlagLogo.layer.cornerRadius = 25
        //        countryFlagLogo.clipsToBounds = true
        //        athleteLogoView.addSubview(countryFlagLogo)
        //
        //        countryFlagLogo.snp.makeConstraints {
        //            $0.top.equalTo(navigationView.snp.bottom).inset(-12)
        //            $0.leading.equalTo(athleteLogoView.snp.leading).inset(60)
        //            $0.height.width.equalTo(50)
        //        }
        //
        //
        //        //    let teamFlagLogo = UIImageView()
        //        teamFlagLogo.image = UIImage(named: "juventusFlag")
        //        teamFlagLogo.layer.cornerRadius = 25
        //        teamFlagLogo.clipsToBounds = true
        //        athleteLogoView.addSubview(teamFlagLogo)
        //
        //        teamFlagLogo.snp.makeConstraints {
        //            $0.trailing.equalTo(countryFlagLogo.snp.leading).inset(16)
        //            $0.centerY.equalTo(countryFlagLogo.snp.centerY).inset(0)
        //            $0.height.width.equalTo(50)
        //        }
        //
        //        //    let playerNameLabel = UILabel()
        //        playerNameLabel.text = "Ronaldo"
        //        playerNameLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        //        playerNameLabel.adjustsFontSizeToFitWidth = true
        //        playerNameLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        //        athleteLogoView.addSubview(playerNameLabel)
        //        playerNameLabel.snp.makeConstraints {
        //            $0.top.equalTo(teamFlagLogo.snp.bottom).inset(0)
        //            $0.width.equalTo(athleteLogoView.snp.width).multipliedBy(0.5)
        //            $0.leading.equalToSuperview().inset(12)
        //        }
        //
        //        //    let uniformLogoView = UIView()
        //        athleteLogoView.addSubview(uniformLogoView)
        //
        //        uniformLogoView.snp.makeConstraints {
        //            $0.bottom.equalTo(athleteInfoStackView.snp.top).inset(-20)
        //            $0.height.width.equalTo(athleteLogoView.snp.width).multipliedBy(0.1)
        //            $0.leading.equalToSuperview().inset(24)
        //        }
        //
        //        //    let uniformLogo = UIImageView()
        //        uniformLogo.image = UIImage(named: "uniformLogo")
        //        uniformLogoView.addSubview(uniformLogo)
        //        uniformLogo.snp.makeConstraints {
        //            $0.edges.equalToSuperview()
        //        }
        //
        //        //    let athleteNumber = UILabel()
        //        athleteNumber.text = "7"
        //        athleteNumber.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        //        athleteNumber.adjustsFontSizeToFitWidth = true
        //        athleteNumber.textAlignment = .center
        //        athleteNumber.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        //        uniformLogoView.addSubview(athleteNumber)
        //        athleteNumber.snp.makeConstraints {
        //            $0.centerY.equalTo(uniformLogoView.snp.centerY)
        //            $0.centerX.equalTo(uniformLogoView.snp.centerX)
        //            $0.edges.equalTo(uniformLogoView).inset(12)
        //        }
        //
        //        //    let athleteRole = UILabel()
        //        athleteRole.text = "FORWARD"
        //        athleteRole.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        //        athleteRole.adjustsFontSizeToFitWidth = true
        //        athleteRole.textAlignment = .center
        //        athleteRole.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        //        athleteLogoView.addSubview(athleteRole)
        //        athleteRole.snp.makeConstraints {
        //            $0.centerY.equalTo(uniformLogoView.snp.centerY)
        //            $0.leading.equalTo(uniformLogoView.snp.trailing).inset(0)
        //        }

    }
    @objc private func tapShareBtn() {
        print("Tap share")
    }
    
    @objc private func tapBookmarkBtn() {
        print("Tap bookmark")
    }
    
    @objc private func tapBackBtn() {
        print("Tap back")
    }
}
