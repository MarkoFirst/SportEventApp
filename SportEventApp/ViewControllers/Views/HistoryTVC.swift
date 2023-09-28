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
    
    private var sectionView = UIView()
    private var sectionTitleLabel = UILabel()
    private var yearsStackView = UIStackView()
    private var timelineStackView = UIStackView()
    
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
        
        sectionView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.layer.cornerCurve = .continuous
            view.clipsToBounds = true
            view.backgroundColor = UIColor.clear
            
            return view
        }()
        
        sectionTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor.white
            
            return label
        }()
        
        
        
        yearsStackView = {
            let stackView  = UIStackView(arrangedSubviews: years.map ({ year in
                let yearView: UIView = {
                    let view  = UIView()
                    view.layer.cornerRadius = 13
                    view.layer.cornerCurve = .continuous
                    view.clipsToBounds = true
                    view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22)
                    
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
          
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 16
            stackView.distribution = .equalSpacing
            
            return stackView
        }()
        
        timelineStackView = {
            let stackView  = UIStackView(arrangedSubviews: teamsLogo.map ({ logo in
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
          
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 0
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView: UIVisualEffectView = {
            let blur = UIVisualEffectView(effect: blurEffect)
            blur.frame = sectionView.bounds
            blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            return blur
        }()
        
        // MARK: Adding views
        
        contentView.addSubview(sectionView)
        sectionView.addSubview(sectionTitleLabel)
        sectionView.addSubview(yearsStackView)
        sectionView.addSubview(timelineStackView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        sectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(16)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(sectionView).inset(16)
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
    }
    
    func configure(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}

