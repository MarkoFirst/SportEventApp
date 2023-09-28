//
//  StatsTVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 21.09.2023.
//

import Foundation
import UIKit
import SnapKit

class StatsTVC: UITableViewCell {
    
    private var sectionView = UIView()
    private var sectionTitleLabel = UILabel()
    private var headerView = UIView()
    private var greenSquareView = AthleteStatView()
    private var goalStackView = UIStackView()
    private var separatorView = UIView()
    private var disciplineView = UIView()
    private var disciplineTitleLabel = UILabel()
    private var disciplineGreenView = UIView()
    private var disciplineStackView = UIStackView()
    
    let discipline: [(UInt, String, UIImage?)] = [
        (8, "Fouls won", nil),
        (3, "Fouls conceded", nil),
        (3, "Yellow cards", UIImage(named: "yellowCard")),
        (1, "Red cards", UIImage(named: "redCard")),
    ]
    
    let goals: [(UInt, String)] = [
        (8, "Shot on target"),
        (6, "Goals scored")
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatsTVC {
    
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
        
        greenSquareView = {
            let view = AthleteStatView()
            view.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
            view.layer.cornerRadius = 12
            view.configure(title: "Label", subtitle: "14")
            
            return view
        }()
        
        goalStackView = {
            let stackView = UIStackView(arrangedSubviews: goals.map ({ (count, label) in
                let view = GoalView()
                view.countLabel.text = count.description
                view.goalLabel.text = label
                
                view.snp.makeConstraints { make in
                    make.width.equalTo(64)
                }
            
                return view
            }))
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        separatorView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
            
            return view
        }()
        
        disciplineTitleLabel = {
            let label = UILabel()
            label.text = "DISCIPLINE"
            label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor.white
            
            return label
        }()
        
        disciplineGreenView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
            view.layer.cornerRadius = 2
            
            return view
        }()
        
        disciplineStackView = {
            let stackView = UIStackView(arrangedSubviews: discipline.map ({ (qty, name, image) in
                let view = DisciplineView()

                view.titleLabel.text = qty.description
                view.subtitleLabel.text = name
                view.imageView.image = image
                
                return view
            }))
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.alignment = .fill
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
        sectionView.addSubview(headerView)
        sectionView.addSubview(separatorView)
        sectionView.addSubview(disciplineView)
        headerView.addSubview(greenSquareView)
        headerView.addSubview(goalStackView)
        disciplineView.addSubview(disciplineTitleLabel)
        disciplineView.addSubview(disciplineGreenView)
        disciplineView.addSubview(disciplineStackView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        sectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sectionView.snp.top).offset(16)
            make.leading.trailing.equalTo(sectionView).inset(16)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(sectionView).inset(16)
        }
        
        greenSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(112)
            make.leading.equalTo(headerView.snp.leading)
            make.top.equalTo(headerView.snp.top)
            make.bottom.equalTo(headerView.snp.bottom)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        
        goalStackView.snp.makeConstraints { make in
            make.leading.equalTo(greenSquareView.snp.trailing).offset(16)
            make.trailing.equalTo(headerView.snp.trailing)
            make.centerY.equalTo(headerView.snp.centerY)
            make.top.equalTo(headerView.snp.top)
            make.bottom.equalTo(headerView.snp.bottom)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(sectionView).inset(16)
            make.height.equalTo(0.5)
        }
        
        disciplineView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(sectionView).inset(16)
            make.bottom.equalTo(sectionView.snp.bottom).offset(-16)
        }
        
        disciplineTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(disciplineView.snp.top).offset(16)
            make.leading.trailing.equalTo(disciplineView)
        }
        
        disciplineGreenView.snp.makeConstraints { make in
            make.centerY.equalTo(disciplineTitleLabel.snp.centerY)
            make.leading.equalTo(disciplineTitleLabel.snp.leading).offset(-16)
            make.width.equalTo(4)
            make.height.equalTo(36)
        }
        
        disciplineStackView.snp.makeConstraints { make in
            make.top.equalTo(disciplineTitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(disciplineView)
            make.bottom.equalTo(disciplineView.snp.bottom)
        }
    }
    
    func configure(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}
