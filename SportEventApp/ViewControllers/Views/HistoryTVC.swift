//
//  HistoryTVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 21.09.2023.
//

import Foundation
import UIKit
import SnapKit

class HistoryTVC: UITableViewCell {
    
    private var sectionTitleLabel: UILabel!
    
    let years = ["2021", "2022", "2023", "2024"]
    let teamsLogo = ["bullsLogo"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryTVC {
    
    private func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        // MARK: Configure views
        
        let sectionView = UIView()
        sectionView.layer.cornerRadius = 12
        sectionView.layer.cornerCurve = .continuous
        sectionView.clipsToBounds = true
        sectionView.backgroundColor = UIColor.clear
        
        sectionTitleLabel = UILabel()
        sectionTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        sectionTitleLabel.numberOfLines = 0
        sectionTitleLabel.adjustsFontSizeToFitWidth = true
        sectionTitleLabel.textColor = UIColor.white
        
        let yearBackLine = UIView()
        yearBackLine.backgroundColor = UIColor(red: 0.453, green: 0.438, blue: 0.492, alpha: 1)
        
        let yearsStackView  = UIStackView(arrangedSubviews: years.map ({ year in
            let yearView: UIView = {
                let view  = UIView()
                view.layer.cornerRadius = 13
                view.layer.cornerCurve = .continuous
                view.clipsToBounds = true
                view.backgroundColor = UIColor(red: 0.453, green: 0.438, blue: 0.492, alpha: 1)
                
                return view
            }()
            
            let yearLabel: UILabel = {
                let label  = UILabel()
                label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
                label.numberOfLines = 1
                label.adjustsFontSizeToFitWidth = true
                label.textColor = UIColor.white
                label.text = year
                return label
            }()
            
            yearView.addSubview(yearLabel)
            
            yearLabel.snp.makeConstraints { make in
                make.horizontalEdges.equalTo(yearView).inset(8)
                make.verticalEdges.equalTo(yearView).inset(4)
            }
            
            return yearView
        }))
        yearsStackView.axis = .horizontal
        yearsStackView.alignment = .fill
        yearsStackView.spacing = 16
        yearsStackView.distribution = .equalSpacing
        
        let timelineStackView  = UIStackView(arrangedSubviews: teamsLogo.map ({ logo in
            let timelineView: UIView = {
                let view  = UIView()
                view.layer.cornerRadius = 2
                view.layer.cornerCurve = .continuous
                view.backgroundColor = UIColor(red: 0.804, green: 0.067, blue: 0.255, alpha: 1)
                
                return view
            }()
            
            let teamLogo: UIImageView = {
                let imageView  = UIImageView()
                imageView.contentMode = .scaleAspectFill
                imageView.image = UIImage(named: logo)
                
                return imageView
            }()
            
            timelineView.addSubview(teamLogo)
            
            timelineView.snp.makeConstraints { make in
                make.height.equalTo(4)
            }
            
            teamLogo.snp.makeConstraints { make in
                make.center.equalTo(timelineView)
                make.width.height.equalTo(24)
            }
            
            return timelineView
        }))
        timelineStackView.axis = .horizontal
        timelineStackView.alignment = .fill
        timelineStackView.spacing = 0
        timelineStackView.distribution = .fillEqually
        
        let numberOfLines = 15
        let lineageStackView = UIStackView(arrangedSubviews: (0..<numberOfLines).map { _ in
                let line = UIView()
                line.backgroundColor = UIColor(red: 0.453, green: 0.438, blue: 0.492, alpha: 1)

            line.snp.makeConstraints { make in
                make.width.equalTo(0.5)
                make.height.equalTo(24)
            }

            return line
        })
        lineageStackView.axis = .horizontal
        lineageStackView.alignment = .fill
        lineageStackView.distribution = .equalSpacing
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = sectionView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // MARK: Adding views
        
        contentView.addSubview(sectionView)
        
        sectionView.addSubview(sectionTitleLabel)
        sectionView.addSubview(yearBackLine)
        sectionView.addSubview(yearsStackView)
        sectionView.addSubview(timelineStackView)
        sectionView.addSubview(lineageStackView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        sectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(16)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(sectionView).inset(16)
        }
        
        yearBackLine.snp.makeConstraints { make in
            make.centerY.equalTo(yearsStackView.snp.centerY)
            make.horizontalEdges.equalTo(sectionView)
            make.height.equalTo(0.5)
        }
        
        yearsStackView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(sectionView).inset(16)
        }
        
        timelineStackView.snp.makeConstraints { make in
            make.top.equalTo(yearsStackView.snp.bottom).offset(32)
            make.left.equalTo(sectionView)
            make.right.equalTo(sectionView).inset(64)
            make.bottom.equalTo(sectionView).inset(32)
        }
        
        lineageStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(sectionView).inset(16)
            make.bottom.equalTo(sectionView.snp.bottom)
        }
    }
    
    func configure(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}

