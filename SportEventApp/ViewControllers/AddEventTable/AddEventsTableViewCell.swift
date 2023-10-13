//
//  EventsTableViewcellTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 05.10.2023.
//

import UIKit

class AddEventsTableViewCell: UITableViewCell {
    var delegateItem: EventCoreData?
        
    private var backgroundImage = UIImageView()
    private var eventName = UILabel()
    private var eventDescription = UILabel()
    private var eventDate = UILabel()
    private var firstTeamPlaying = UILabel()
    private var secondTeamPlaying = UILabel()
           
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddEventsTableViewCell {
    func configureByCD(with data: EventCoreData?) {
        self.delegateItem = data
        eventName.text = data?.eventName
        eventDescription.text = data?.eventDescription
        guard let eventImageData = data?.eventImage else { return  }
        guard let image = UIImage(data: eventImageData) else { return print("Ошибка при загрузке изображения.")}
        backgroundImage.image = image
        eventDate.text = data?.date
        firstTeamPlaying.text = data?.firtsTeam
        secondTeamPlaying.text = data?.secondTeam
    }
    
    func setupLabel(label : UILabel!) {
        label.clipsToBounds = true
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.backgroundColor = .white
    }
    
    func setupLayout() {
        contentView.backgroundColor = UIColor(red: 0, green: 0.14, blue: 0.25, alpha: 1)
        backgroundImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(backgroundImage)
        
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(10)
            $0.height.lessThanOrEqualTo(300)
        }
        
        let labelArray = [(eventName, eventDescription, firstTeamPlaying, secondTeamPlaying)]
        
        let stackView = UIStackView(arrangedSubviews: labelArray.map({ nameLabel, descriptionLabel, firstTeamLabel, secondTeamLabel in
            let myView = UIView()
            
            let textSV = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
            textSV.axis = .horizontal
            textSV.spacing =  10
            textSV.distribution = .fillEqually
            descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
            descriptionLabel.numberOfLines = 0
            nameLabel.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
            nameLabel.numberOfLines = 0
            setupLabel(label: nameLabel)
            eventName.font = .systemFont(ofSize: 20, weight: .heavy)
            setupLabel(label: descriptionLabel)
            descriptionLabel.textColor = .gray
            myView.addSubview(textSV)
            
            textSV.snp.makeConstraints {
                $0.top.equalTo(myView).inset(20)
                $0.left.right.equalTo(myView).inset(10)
            }
            
            let teamsSV = UIStackView(arrangedSubviews: [firstTeamLabel, secondTeamLabel])
            teamsSV.axis = .horizontal
            teamsSV.spacing = 10
            teamsSV.distribution = .fillEqually
            setupLabel(label: firstTeamLabel)
            setupLabel(label: secondTeamLabel)
                        
            myView.addSubview(teamsSV)
            
            teamsSV.snp.makeConstraints {
                $0.top.equalTo(textSV.snp.bottom).offset(100)
                $0.left.right.equalTo(myView).inset(10)
                $0.height.equalTo(50)
            }
                        
            return myView
        }))
        
        stackView.axis = .vertical
        backgroundImage.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(backgroundImage)
        }
        
        backgroundImage.addSubview(eventDate)
        
        setupLabel(label: eventDate)
        eventDate.snp.makeConstraints {
            $0.centerX.equalTo(backgroundImage.snp.centerX)
            $0.top.equalTo(stackView.snp.bottom)
            $0.height.equalTo(36)
            $0.bottom.equalTo(backgroundImage.snp.bottom).inset(20)
        }
    }
}
