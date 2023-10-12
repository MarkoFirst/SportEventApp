//
//  HistoryTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.09.2023.
//

import Foundation
import UIKit
import SnapKit

class HistoryTVC: UITableViewCell {
    
    var athlete: Athlete?
    var historyView: UIView!
    var stackView: UIStackView!
    
    var linePositionValue = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryTVC: UIScrollViewDelegate {
    
    private func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        historyView = UIView()
        historyView.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 1)
        historyView.layer.cornerRadius = 20
        contentView.addSubview(historyView)
        
        let historyLabel = UILabel()
        historyLabel.text = "HISTORY"
        historyLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        historyLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        historyLabel.adjustsFontSizeToFitWidth = true
        historyView.addSubview(historyLabel)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        historyView.addSubview(separatorView)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.cornerRadius = 20
        scrollView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        historyView.addSubview(scrollView)
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = true
        stackView.autoresizesSubviews = true
        scrollView.addSubview(stackView)
        
        historyView.snp.makeConstraints { $0.edges.equalToSuperview().inset(12) }
        
        historyLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(historyLabel.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { $0.edges.height.equalToSuperview() }
    }
    
    func linePosition() -> Int {
        
        linePositionValue.toggle()
        
        if linePositionValue {
            return 20
        } else {
            return -20
        }
    }
    
    func setupAthleteHistory(teams: [AthleteTeams]) {
        
        teams.forEach { team in
            
            let globalView = UIView()
            globalView.backgroundColor = .clear
            stackView.addArrangedSubview(globalView)
            
            let yearsStackview = UIStackView()
            yearsStackview.axis = .horizontal
            yearsStackview.spacing = 0
            yearsStackview.translatesAutoresizingMaskIntoConstraints = true
            yearsStackview.autoresizesSubviews = true
            globalView.addSubview(yearsStackview)
            
            for year in team.fromYearInTeam..<team.toYearInTeam {
                
                let view = UIView()
                view.backgroundColor = .clear
                yearsStackview.addArrangedSubview(view)
                
                let separatorView = UIView()
                separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
                view.addSubview(separatorView)
                
                let yearView = UIView()
                yearView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
                yearView.layer.cornerRadius = 12
                yearView.layer.borderWidth = 2
                yearView.layer.borderColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1).cgColor
                view.addSubview(yearView)
                
                let yearLabel = UILabel()
                yearLabel.text = year.description
                yearLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
                yearLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                yearLabel.textAlignment = .center
                yearLabel.adjustsFontSizeToFitWidth = true
                yearView.addSubview(yearLabel)
                
                let image = UIImageView()
                image.image = UIImage(named: "groupLines")
                view.addSubview(image)
                
                yearView.snp.makeConstraints {
                    $0.top.equalToSuperview().inset(4)
                    $0.leading.equalToSuperview().inset(8)
                    $0.height.equalTo(24)
                    $0.width.equalTo(yearView.snp.height).multipliedBy(2.5)
                }
                
                yearLabel.snp.makeConstraints { $0.edges.equalToSuperview().inset(4) }
                
                separatorView.snp.makeConstraints {
                    $0.height.equalTo(0.5)
                    $0.centerY.equalTo(yearView.snp.centerY)
                    $0.leading.trailing.equalToSuperview()
                }
                
                image.snp.makeConstraints {
                    $0.top.equalTo(yearLabel.snp.bottom).inset(0)
                    $0.width.equalTo(historyView.snp.width).multipliedBy(0.3)
                    $0.height.equalTo(image.snp.width).multipliedBy(1.2)
                    $0.leading.equalToSuperview().inset(8)
                    $0.trailing.bottom.equalToSuperview()
                }
            }
            
            let line = UIView()
            line.backgroundColor = ColorsList(rawValue: team.teamColor)?.uiColor
            line.layer.cornerRadius = 2
            globalView.addSubview(line)
            
            let teamIcon = UIImageView()
            teamIcon.image = UIImage(named: team.iconName)
            teamIcon.layer.cornerRadius = 20
            teamIcon.layer.masksToBounds = true
            globalView.addSubview(teamIcon)
            
            yearsStackview.snp.makeConstraints { $0.edges.equalToSuperview()}
            
            line.snp.makeConstraints {
                $0.height.equalTo(4)
                $0.leading.trailing.equalToSuperview().inset(4)
                $0.centerY.equalToSuperview().offset(linePosition())
            }
            
            teamIcon.snp.makeConstraints {
                $0.centerY.equalTo(line.snp.centerY)
                $0.centerX.equalTo(line.snp.centerX)
                $0.size.equalTo(40)
            }
        }
    }
}
