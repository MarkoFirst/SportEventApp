//
//  NewsTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 23.09.2023.
//

import Foundation
import UIKit
import SnapKit

class NewsTVC: UITableViewCell {
    
    let athleteTeamFlag = "juventusFlag"
    let athleteIcon = "ronaldoIcon"
    let typeNews = "Football news"
    let teamName = "Juve"
    let athleteLastName = "Ronaldo"
    let newsDateDay = 22
    let newsDateMonth = "Oct"
    let newsDescription = "Ronaldo nominated for UEFA Men`s Player of the year"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsTVC {
    
    func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let newsView = UIView()
        newsView.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 1)
        newsView.layer.cornerRadius = 20
        contentView.addSubview(newsView)

        let teamFlagLogo = UIImageView()
        teamFlagLogo.image = UIImage(named: athleteTeamFlag)
        teamFlagLogo.layer.cornerRadius = 25
        teamFlagLogo.clipsToBounds = true
        newsView.addSubview(teamFlagLogo)

        let athleteImage = UIImageView()
        athleteImage.image = UIImage(named: athleteIcon)
        athleteImage.layer.cornerRadius = 20
        athleteImage.clipsToBounds = true
        newsView.addSubview(athleteImage)
    
        let shareNewsBtn = UIButton(type: .system)
        shareNewsBtn.backgroundColor = UIColor(red: 0.133, green: 0.122, blue: 0.196, alpha: 0.95)
        shareNewsBtn.layer.borderWidth = 1
        shareNewsBtn.layer.cornerRadius = 20
        shareNewsBtn.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
        shareNewsBtn.setImage(UIImage(named: "shareArrow"), for: .normal)
        shareNewsBtn.tintColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        shareNewsBtn.addTarget(self, action: #selector(tapShareNewsBtn), for: .touchUpInside)
        newsView.addSubview(shareNewsBtn)
        
        let newsInfoStackView = UIStackView()
        newsInfoStackView.axis = .vertical
        newsView.addSubview(newsInfoStackView)
        
        let typeNewsLabel = UILabel()
        typeNewsLabel.text = typeNews
        typeNewsLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        typeNewsLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        typeNewsLabel.adjustsFontSizeToFitWidth = true
        newsInfoStackView.addArrangedSubview(typeNewsLabel)
        
        let athleteNewsInfo = UILabel()
        athleteNewsInfo.text = "\(teamName), \(athleteLastName)"
        athleteNewsInfo.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        athleteNewsInfo.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        athleteNewsInfo.adjustsFontSizeToFitWidth = true
        newsInfoStackView.addArrangedSubview(athleteNewsInfo)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        newsView.addSubview(separatorView)

        let newsItemStackView = UIStackView()
        newsItemStackView.axis = .horizontal
        newsItemStackView.alignment = .center
        newsItemStackView.spacing = 8

        let newsDateStackView = UIStackView()
        newsDateStackView.axis = .vertical
        newsDateStackView.alignment = .center
        newsItemStackView.addArrangedSubview(newsDateStackView)

        let newsDateDayLabel = UILabel()
        newsDateDayLabel.text = newsDateDay.description
        newsDateDayLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        newsDateDayLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        newsDateDayLabel.adjustsFontSizeToFitWidth = true
        newsDateStackView.addArrangedSubview(newsDateDayLabel)
        
        let newsDateMonthLabel = UILabel()
        newsDateMonthLabel.text = newsDateMonth
        newsDateMonthLabel.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        newsDateMonthLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        newsDateMonthLabel.adjustsFontSizeToFitWidth = true
        newsDateStackView.addArrangedSubview(newsDateMonthLabel)
        
        let newsDescriptionLabel = UILabel()
        newsDescriptionLabel.text = newsDescription
        newsDescriptionLabel.numberOfLines = 0
        newsDescriptionLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        newsDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        newsDescriptionLabel.adjustsFontSizeToFitWidth = true
        newsItemStackView.addArrangedSubview(newsDescriptionLabel)
        
        newsView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
            $0.height.equalTo(160)
        }
        
        teamFlagLogo.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.top.leading.equalToSuperview().inset(20)
        }
        
        athleteImage.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalTo(teamFlagLogo.snp.centerY)
            $0.leading.equalTo(teamFlagLogo.snp.trailing).inset(25)
        }
        
        shareNewsBtn.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalTo(teamFlagLogo.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        newsInfoStackView.snp.makeConstraints {
            $0.centerY.equalTo(teamFlagLogo.snp.centerY)
            $0.leading.equalTo(athleteImage.snp.trailing).inset(-12)
            $0.trailing.equalTo(shareNewsBtn.snp.leading).inset(12)
            $0.height.equalTo(40)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(teamFlagLogo.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        newsView.addSubview(newsItemStackView)
        newsItemStackView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        newsDateStackView.snp.makeConstraints {
            $0.height.width.equalTo(50)
        }
        
        newsDescriptionLabel.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    @objc private func tapShareNewsBtn() {
        print("Tap share news")
    }
}
