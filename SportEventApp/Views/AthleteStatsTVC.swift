//
//  AthleteStatsTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 24.09.2023.
//

import Foundation
import UIKit
import SnapKit

class AthleteStatsTVC: UITableViewCell {
    
    var kickStatsLabel: UILabel!
    var percentShotOnTarget: UIImageView!
    var percentGoalsScored: UIImageView!
    var allKicksStats: UILabel!
    var shotsOnTarget: UILabel!
    var goalsScored: UILabel!
    var foulsWonLabel: UILabel!
    var foulsConceded: UILabel!
    var yellowCardsValue: UILabel!
    var redCardsValue: UILabel!
    
    private let statsInfo = ["Shots on target", "Goals scored"]
    private let disciplineItem = ["Fouls won", "Fouls conceded"]
    private let cardItem = ["Yellow cards", "Red cards"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AthleteStatsTVC {
    
    func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let statsView = UIView()
        statsView.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 1)
        statsView.layer.cornerRadius = 20
        contentView.addSubview(statsView)
        
        let statsLabel = UILabel()
        statsLabel.text = "ATHLETE STATS"
        statsLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        statsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        statsLabel.adjustsFontSizeToFitWidth = true
        statsView.addSubview(statsLabel)
        
        let kickStatsStackView = UIStackView()
        kickStatsStackView.axis = .horizontal
        kickStatsStackView.spacing = 4
        kickStatsStackView.alignment = .center
        kickStatsStackView.distribution = .fillEqually
        statsView.addSubview(kickStatsStackView)
        
        let kickStats = UIView()
        kickStats.backgroundColor = UIColor(red: 0.271, green: 0.498, blue: 0.302, alpha: 1)
        kickStats.layer.cornerRadius = 20
        kickStatsStackView.addArrangedSubview(kickStats)
        
        let shoeIcon = UIImageView()
        shoeIcon.image = UIImage(named: "footballShoeLogo")
        kickStats.addSubview(shoeIcon)
        
        kickStatsLabel = UILabel()
        kickStatsLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        kickStatsLabel.textAlignment = .center
        kickStatsLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        kickStatsLabel.adjustsFontSizeToFitWidth = true
        kickStats.addSubview(kickStatsLabel)
        
        statsInfo.forEach { item in
            
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            kickStatsStackView.addArrangedSubview(stackView)
            
            let shotsOnTargetView = UIView()
            shotsOnTargetView.backgroundColor = .clear
            stackView.addArrangedSubview(shotsOnTargetView)
            
            let statsImage = UIImageView()
            
            switch item {
            case "Shots on target":
                percentShotOnTarget = statsImage
            default:
                percentGoalsScored = statsImage
            }
            
            shotsOnTargetView.addSubview(statsImage)
            
            let labelValue = UILabel()
            labelValue.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            labelValue.numberOfLines = 2
            labelValue.textAlignment = .center
            labelValue.font = UIFont.systemFont(ofSize: 44, weight: .bold)
            labelValue.adjustsFontSizeToFitWidth = true
            shotsOnTargetView.addSubview(labelValue)
            
            switch item {
            case "Shots on target":
                shotsOnTarget = labelValue
            default:
                goalsScored = labelValue
            }
            
            let label = UILabel()
            label.text = item
            label.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
            label.numberOfLines = 2
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.adjustsFontSizeToFitWidth = true
            stackView.addArrangedSubview(label)
            
            stackView.snp.makeConstraints { $0.height.equalTo(kickStats.snp.height).multipliedBy(1) }
            
            shotsOnTargetView.snp.makeConstraints { $0.height.equalTo(shotsOnTargetView.snp.width).multipliedBy(1) }
            
            statsImage.snp.makeConstraints {
                $0.height.equalTo(statsImage.snp.width).multipliedBy(1)
                $0.edges.equalToSuperview().inset(8)
            }
            
            labelValue.snp.makeConstraints {
                $0.centerY.centerX.equalToSuperview()
                $0.width.height.equalToSuperview().multipliedBy(0.2)
            }
            
            label.snp.makeConstraints {
                $0.width.equalToSuperview().multipliedBy(0.6)
                $0.height.equalTo(label.snp.width).multipliedBy(0.5)
            }
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        statsView.addSubview(separatorView)
        
        let vericalSeparatorView = UIView()
        vericalSeparatorView.backgroundColor = UIColor(red: 0.271, green: 0.498, blue: 0.302, alpha: 1)
        vericalSeparatorView.layer.cornerRadius = 2
        statsView.addSubview(vericalSeparatorView)
        
        let disciplineLabel = UILabel()
        disciplineLabel.text = "Discipline"
        disciplineLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        disciplineLabel.textAlignment = .center
        disciplineLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        statsView.addSubview(disciplineLabel)
        
        let foulsStackView = UIStackView()
        foulsStackView.axis = .horizontal
        foulsStackView.spacing = 8
        foulsStackView.alignment = .center
        foulsStackView.distribution = .fillEqually
        statsView.addSubview(foulsStackView)
        
        disciplineItem.forEach {
            
            let foulsView = UIView()
            foulsView.backgroundColor = .clear
            foulsStackView.addArrangedSubview(foulsView)
            
            let vericalLine = UIView()
            vericalLine.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
            vericalLine.layer.cornerRadius = 0.5
            foulsView.addSubview(vericalLine)
            
            let foulsValueLabel = UILabel()
            
            switch $0 {
            case "Fouls won":
                foulsWonLabel = foulsValueLabel
            default:
                foulsConceded = foulsValueLabel
            }
            
            foulsValueLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            foulsValueLabel.textAlignment = .left
            foulsValueLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
            foulsValueLabel.adjustsFontSizeToFitWidth = true
            foulsView.addSubview(foulsValueLabel)
            
            let foulsItemLabel = UILabel()
            foulsItemLabel.text = $0
            foulsItemLabel.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
            foulsItemLabel.textAlignment = .left
            foulsItemLabel.numberOfLines = 2
            foulsItemLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
            foulsItemLabel.adjustsFontSizeToFitWidth = true
            foulsView.addSubview(foulsItemLabel)
            
            foulsView.snp.makeConstraints { $0.height.equalTo(foulsView.snp.width).multipliedBy(1) }
            
            vericalLine.snp.makeConstraints {
                $0.width.equalTo(1)
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(foulsView.snp.height).multipliedBy(0.3)
            }
            
            foulsValueLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(0)
                $0.leading.equalTo(vericalLine.snp.trailing).inset(-12)
                $0.size.equalTo(foulsView.snp.size).multipliedBy(0.3)
            }
            
            foulsItemLabel.snp.makeConstraints {
                $0.top.equalTo(foulsValueLabel.snp.bottom).inset(-4)
                $0.leading.equalTo(vericalLine.snp.trailing).inset(-12)
                $0.height.equalTo(foulsView.snp.height).multipliedBy(0.3)
                $0.width.equalTo(foulsView.snp.width).multipliedBy(0.7)
            }
        }
        
        cardItem.forEach { item in
            
            let cardsView = UIView()
            cardsView.backgroundColor = .clear
            foulsStackView.addArrangedSubview(cardsView)
            
            let vericalLine = UIView()
            vericalLine.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
            vericalLine.layer.cornerRadius = 0.5
            cardsView.addSubview(vericalLine)
            
            let cardsValueLabel = UILabel()
            
            switch item {
            case "Yellow cards":
                yellowCardsValue = cardsValueLabel
            default:
                redCardsValue = cardsValueLabel
            }
            
            cardsValueLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
            cardsValueLabel.textAlignment = .left
            cardsValueLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
            cardsValueLabel.adjustsFontSizeToFitWidth = true
            cardsView.addSubview(cardsValueLabel)
            
            let cardLogo = UIView()
            
            cardLogo.backgroundColor = {
                switch item {
                case "Yellow cards":
                    return .yellow
                case "Red cards":
                    return .red
                default:
                    return .clear
                }
            }()
            
            cardLogo.layer.cornerRadius = 2
            cardsView.addSubview(cardLogo)
            
            let cardsItemLabel = UILabel()
            cardsItemLabel.text = item
            cardsItemLabel.textColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
            cardsItemLabel.textAlignment = .left
            cardsItemLabel.numberOfLines = 2
            cardsItemLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
            cardsItemLabel.adjustsFontSizeToFitWidth = true
            cardsView.addSubview(cardsItemLabel)
            
            cardsView.snp.makeConstraints { $0.height.equalTo(cardsView.snp.width).multipliedBy(1) }
            
            vericalLine.snp.makeConstraints {
                $0.width.equalTo(1)
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(cardsView.snp.height).multipliedBy(0.3)
            }
            
            cardsValueLabel.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalTo(vericalLine.snp.trailing).inset(-12)
                $0.size.equalTo(cardsView.snp.size).multipliedBy(0.3)
            }
            
            cardLogo.snp.makeConstraints {
                $0.centerY.equalTo(vericalLine.snp.centerY)
                $0.leading.equalTo(cardsValueLabel.snp.trailing)
                $0.height.equalTo(cardsView.snp.height).multipliedBy(0.2)
                $0.width.equalTo(cardLogo.snp.height).multipliedBy(0.7)
            }
            
            cardsItemLabel.snp.makeConstraints {
                $0.top.equalTo(cardsValueLabel.snp.bottom).inset(-4)
                $0.leading.equalTo(vericalLine.snp.trailing).inset(-12)
                $0.height.equalTo(cardsView.snp.height).multipliedBy(0.3)
                $0.width.equalTo(cardsView.snp.width).multipliedBy(0.5)
            }
        }
        
        let hideLine = UIView()
        hideLine.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        statsView.addSubview(hideLine)
        
        statsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        kickStatsStackView.snp.makeConstraints {
            $0.top.equalTo(statsLabel.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        kickStats.snp.makeConstraints { $0.height.equalTo(kickStats.snp.width).multipliedBy(1) }
        
        shoeIcon.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.width.equalTo(kickStats.snp.width).multipliedBy(0.5)
            $0.height.equalTo(shoeIcon.snp.width).multipliedBy(1)
        }
        
        kickStatsLabel.snp.makeConstraints {
            $0.centerY.equalTo(shoeIcon.snp.centerY)
            $0.leading.equalTo(shoeIcon.snp.trailing).inset(8)
            $0.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(kickStats.snp.height).multipliedBy(0.3)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(kickStatsStackView.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        vericalSeparatorView.snp.makeConstraints {
            $0.width.equalTo(4)
            $0.height.equalTo(30)
            $0.top.equalTo(separatorView.snp.bottom).inset(-12)
            $0.leading.equalToSuperview()
        }
        
        disciplineLabel.snp.makeConstraints {
            $0.centerY.equalTo(vericalSeparatorView.snp.centerY)
            $0.leading.equalTo(vericalSeparatorView.snp.trailing).inset(-12)
        }
        
        foulsStackView.snp.makeConstraints {
            $0.top.equalTo(vericalSeparatorView.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        hideLine.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.top.equalTo(foulsStackView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.bottom.equalTo(statsView.snp.bottom).inset(12)
        }
        
        statsView.snp.makeConstraints { $0.edges.equalToSuperview().inset(12) }
    }
    
    func percentImage(number: UInt, from: UInt) -> String {
        
        switch Float(number) / Float(from) * 100 {
        case 0...12:
            return "stats0-100"
        case 13...25:
            return "stats12-100"
        case 26...37:
            return "stats25-100"
        case 38...50:
            return "stats37-100"
        case 51...62:
            return "stats50-100"
        case 63...75:
            return "stats62-100"
        case 76...87:
            return "stats75-100"
        case 88...99:
            return "stats87-100"
        default:
            return "stats100-100"
        }
    }
}
