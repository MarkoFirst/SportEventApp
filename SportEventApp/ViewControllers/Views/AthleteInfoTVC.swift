//
//  AthleteInfoTVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 13.09.2023.
//

import UIKit
import SnapKit

class AthleteInfoTVC: UITableViewCell {
    
    private var athleteImageView: UIImageView!
    private var firstNameLabel: UILabel!
    private var lastNameLabel: UILabel!
    private var ageView = AthleteStatView()
    private var gamesView = AthleteStatView()
    private var goalsView = AthleteStatView()
    
    let screenWidth = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AthleteInfoTVC {
    
    func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        // MARK: Configure views
        
        athleteImageView = UIImageView()
        athleteImageView.contentMode = .scaleAspectFill
        
        let teamLogoView = UIImageView()
        teamLogoView.image = UIImage(named: "bullsLogo")
        teamLogoView.contentMode = .scaleAspectFill
        
        firstNameLabel = UILabel()
        firstNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        firstNameLabel.numberOfLines = 0
        firstNameLabel.adjustsFontSizeToFitWidth = true
        firstNameLabel.textAlignment = .left
        firstNameLabel.textColor = .white
        
        lastNameLabel = UILabel()
        lastNameLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        lastNameLabel.numberOfLines = 0
        lastNameLabel.adjustsFontSizeToFitWidth = true
        lastNameLabel.textAlignment = .left
        lastNameLabel.textColor = .white
        
        let nameStackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel])
        nameStackView.axis = .vertical
        nameStackView.spacing = 4
        nameStackView.alignment = .leading
        nameStackView.distribution = .fillProportionally
        nameStackView.backgroundColor = .clear
        
        let infoView = UIView()
        
        // MARK: Adding views
        
        contentView.addSubview(athleteImageView)
        contentView.addSubview(nameStackView)
        contentView.addSubview(infoView)
        
        athleteImageView.addSubview(nameStackView)
        athleteImageView.addSubview(teamLogoView)
        
        infoView.addSubview(ageView)
        infoView.addSubview(gamesView)
        infoView.addSubview(goalsView)
        
        // MARK: Setup constraints
        
        athleteImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView)
            make.height.equalTo(athleteImageView.snp.width)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.top).offset(-16)
            make.leading.trailing.equalTo(athleteImageView).inset(16)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(athleteImageView.snp.bottom).offset(-24)
            make.bottom.horizontalEdges.equalTo(contentView).inset(16)
            make.height.equalTo(ageView)
        }
        
        ageView.snp.makeConstraints { make in
            make.leading.equalTo(infoView)
            make.height.equalTo(ageView.snp.width)
            make.centerY.equalTo(infoView.snp.centerY)
        }
        
        gamesView.snp.makeConstraints { make in
            make.leading.equalTo(ageView.snp.trailing).offset(16)
            make.width.equalTo(ageView)
            make.height.equalTo(gamesView.snp.width)
            make.centerY.equalTo(infoView.snp.centerY)
        }
        
        goalsView.snp.makeConstraints { make in
            make.leading.equalTo(gamesView.snp.trailing).offset(16)
            make.width.equalTo(gamesView)
            make.height.equalTo(goalsView.snp.width)
            make.trailing.equalTo(infoView)
            make.centerY.equalTo(infoView.snp.centerY)
        }
        
        teamLogoView.snp.makeConstraints { make in
            make.top.left.equalTo(athleteImageView).inset(24)
            make.width.height.equalTo(40)
        }
    }
    
    func configure(athlete: Athlete) {
        guard let image = athlete.setAthleteImage else { return }
        athleteImageView.image = image
        firstNameLabel.text = athlete.firstName
        lastNameLabel.text = athlete.lastName
        
        ageView.configure(title: "Age", subtitle: athlete.age.description)
        gamesView.configure(title: "Games", subtitle: athlete.games?.description ?? "N/A")
        goalsView.configure(title: "Goals", subtitle: athlete.goals?.description ?? "N/A")
    }
}

