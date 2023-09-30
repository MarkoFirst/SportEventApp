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

    private var sectionTitleLabel: UILabel!
    
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
        
        let headerView = UIView()

        let greenSquareView = AthleteStatView()
        greenSquareView.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
        greenSquareView.layer.cornerRadius = 12
        greenSquareView.configure(title: "Label", subtitle: "14")
 
        let goalStackView = UIStackView(arrangedSubviews: goals.map ({ (count, label) in
            let view = GoalView()
            view.countLabel.text = count.description
            view.goalLabel.text = label
            
            view.snp.makeConstraints { make in
                make.width.equalTo(64)
            }
            
            return view
        }))
        goalStackView.axis = .horizontal
        goalStackView.spacing = 8
        goalStackView.alignment = .center
        goalStackView.distribution = .fillEqually
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        
        let disciplineView = UIView()
            
        let disciplineTitleLabel = UILabel()
        disciplineTitleLabel.text = "DISCIPLINE"
        disciplineTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        disciplineTitleLabel.numberOfLines = 0
        disciplineTitleLabel.adjustsFontSizeToFitWidth = true
        disciplineTitleLabel.textColor = UIColor.white

        let disciplineGreenView = UIView()
        disciplineGreenView.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
        disciplineGreenView.layer.cornerRadius = 2

        let disciplineStackView = UIStackView(arrangedSubviews: discipline.map ({ (qty, name, image) in
            let view = DisciplineView()
            
            view.titleLabel.text = qty.description
            view.subtitleLabel.text = name
            view.imageView.image = image
            
            return view
        }))
        disciplineStackView.axis = .horizontal
        disciplineStackView.spacing = 16
        disciplineStackView.alignment = .fill
        disciplineStackView.distribution = .fillEqually

        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = sectionView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     
        // MARK: Adding views
        
        contentView.addSubview(sectionView)
        
        sectionView.addSubview(sectionTitleLabel)
        sectionView.addSubview(headerView)
        sectionView.addSubview(separatorView)
        sectionView.addSubview(disciplineView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        headerView.addSubview(greenSquareView)
        headerView.addSubview(goalStackView)
        
        disciplineView.addSubview(disciplineTitleLabel)
        disciplineView.addSubview(disciplineGreenView)
        disciplineView.addSubview(disciplineStackView)
        
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
