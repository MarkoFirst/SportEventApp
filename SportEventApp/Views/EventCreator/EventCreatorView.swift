//
//  EventCreatorView.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 15.10.2023.
//

import Foundation
import UIKit
import SnapKit

extension EventCreatorVC: UITextFieldDelegate {
    
    func setupView() {
        
        view.backgroundColor = .white
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        
        let defaulEventsButton = UIButton(type: .system)
        defaulEventsButton.setTitle("Add 10 events", for: .normal)
        defaulEventsButton.setImage(UIImage(systemName: "plus"), for: .normal)
        defaulEventsButton.semanticContentAttribute = .forceRightToLeft
        defaulEventsButton.tintColor = .black
        defaulEventsButton.addTarget(self, action: #selector(addDefaultEvents), for: .touchUpInside)
        view.addSubview(defaulEventsButton)
        
        let mainLabel = UILabel()
        mainLabel.text = "Create event"
        mainLabel.font = .boldSystemFont(ofSize: 32)
        mainLabel.textColor = .black
        view.addSubview(mainLabel)
        
        let eventTitleLabel = UILabel()
        eventTitleLabel.text = "1. Event title:"
        view.addSubview(eventTitleLabel)
        
        eventTitleTF = UITextField()
        eventTitleTF.placeholder = "Title"
        view.addSubview(eventTitleTF)
        
        let eventDescriptionLabel = UILabel()
        eventDescriptionLabel.text = "2. Event description:"
        view.addSubview(eventDescriptionLabel)
        
        eventDescriptionTF = UITextField()
        eventDescriptionTF.placeholder = "Description"
        view.addSubview(eventDescriptionTF)
        
        let eventDateLabel = UILabel()
        eventDateLabel.text = "3. Event date:"
        view.addSubview(eventDateLabel)
        
        eventDatePicker = UIDatePicker()
        eventDatePicker.datePickerMode = .dateAndTime
        eventDatePicker.preferredDatePickerStyle = .compact
        view.addSubview(eventDatePicker)
        
        let eventTypeOfSportLabel = UILabel()
        eventTypeOfSportLabel.text = "4. Event type:"
        view.addSubview(eventTypeOfSportLabel)
        
        typeOfSportPicker = UIPickerView()
        typeOfSportPicker.delegate = self
        typeOfSportPicker.dataSource = self
        
        typeOfSportTF = UITextField()
        typeOfSportTF.placeholder = "Select event type"
        typeOfSportTF.inputView = typeOfSportPicker
        view.addSubview(typeOfSportTF)
        
        let eventPlaceLabel = UILabel()
        eventPlaceLabel.text = "5. Event place:"
        view.addSubview(eventPlaceLabel)
        
        placePicker = UIPickerView()
        placePicker.delegate = self
        placePicker.dataSource = self
        
        placeTF = UITextField()
        placeTF.placeholder = "Select event place"
        placeTF.inputView = placePicker
        view.addSubview(placeTF)
        
        let gameTypeLabel = UILabel()
        gameTypeLabel.text = "6. Game type:"
        view.addSubview(gameTypeLabel)
        
        gameTypePicker = UIPickerView()
        gameTypePicker.delegate = self
        gameTypePicker.dataSource = self
        
        gameTypeTF = UITextField()
        gameTypeTF.placeholder = "Select game type"
        gameTypeTF.inputView = gameTypePicker
        view.addSubview(gameTypeTF)
        
        let eventParticipantsLabel = UILabel()
        eventParticipantsLabel.text = "7. Event participants:"
        view.addSubview(eventParticipantsLabel)
        
        let participantsStackView = UIStackView()
        participantsStackView.axis = .horizontal
        participantsStackView.spacing = 8
        participantsStackView.distribution = .fillProportionally
        participantsStackView.alignment = .center
        view.addSubview(participantsStackView)
        
        firstParticipantPicker = UIPickerView()
        firstParticipantPicker.delegate = self
        firstParticipantPicker.dataSource = self
        
        firstParticipantTF = UITextField()
        firstParticipantTF.placeholder = "Select first participant"
        firstParticipantTF.inputView = firstParticipantPicker
        participantsStackView.addArrangedSubview(firstParticipantTF)
        
        let vsLabel = UILabel()
        vsLabel.text = "vs."
        vsLabel.textAlignment = .center
        participantsStackView.addArrangedSubview(vsLabel)
        
        secondParticipantPicker = UIPickerView()
        secondParticipantPicker.delegate = self
        secondParticipantPicker.dataSource = self
        
        secondParticipantTF = UITextField()
        secondParticipantTF.placeholder = "Select second participant"
        secondParticipantTF.inputView = secondParticipantPicker
        participantsStackView.addArrangedSubview(secondParticipantTF)
        
        let eventImagesLabel = UILabel()
        eventImagesLabel.text = "8. Event image:"
        view.addSubview(eventImagesLabel)
        
        let imageButton = UIButton(type: .system)
        imageButton.setTitle("Select", for: .normal)
        imageButton.addTarget(self, action: #selector(setImage), for: .touchUpInside)
        view.addSubview(imageButton)
        
        let button = UIButton(type: .system)
        button.setTitle("Create event", for: .normal)
        button.addTarget(self, action: #selector(tapCreateEvent), for: .touchUpInside)
        view.addSubview(button)
        
        [eventTitleTF, eventDescriptionTF, typeOfSportTF, placeTF, gameTypeTF, firstParticipantTF, secondParticipantTF].forEach { textField in
            textField?.textColor = .black
            textField?.layer.borderColor = UIColor.black.cgColor
            textField?.layer.borderWidth = 1
            textField?.delegate = self
        }
        
      [eventTitleLabel, eventDescriptionLabel, eventDateLabel, eventTypeOfSportLabel, eventPlaceLabel, gameTypeLabel, eventParticipantsLabel, vsLabel, eventImagesLabel].forEach { label in
            label.font = UIFont(name: "Helvetica", size: 20)
            label.textColor = .black
        }
        
        [imageButton, button].forEach { button in
            button.tintColor = .black
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        defaulEventsButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).inset(-20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventTitleLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventTitleTF.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(28)
        }
        
        eventDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(eventTitleTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventDescriptionTF.snp.makeConstraints {
            $0.top.equalTo(eventDescriptionLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(28)
        }
        
        eventDateLabel.snp.makeConstraints {
            $0.top.equalTo(eventDescriptionTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventDatePicker.snp.makeConstraints {
            $0.centerY.equalTo(eventDateLabel.snp.centerY)
            $0.leading.equalTo(eventDateLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        eventTypeOfSportLabel.snp.makeConstraints {
            $0.top.equalTo(eventDatePicker.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        typeOfSportTF.snp.makeConstraints {
            $0.centerY.equalTo(eventTypeOfSportLabel.snp.centerY)
            $0.leading.equalTo(eventTypeOfSportLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        eventPlaceLabel.snp.makeConstraints {
            $0.top.equalTo(typeOfSportTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        placeTF.snp.makeConstraints {
            $0.centerY.equalTo(eventPlaceLabel.snp.centerY)
            $0.leading.equalTo(eventPlaceLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        gameTypeLabel.snp.makeConstraints {
            $0.top.equalTo(placeTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        gameTypeTF.snp.makeConstraints {
            $0.centerY.equalTo(gameTypeLabel.snp.centerY)
            $0.leading.equalTo(gameTypeLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        eventParticipantsLabel.snp.makeConstraints {
            $0.top.equalTo(gameTypeTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        participantsStackView.snp.makeConstraints {
            $0.top.equalTo(eventParticipantsLabel.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        firstParticipantTF.snp.makeConstraints { $0.height.equalTo(32) }
        
        vsLabel.snp.makeConstraints { $0.size.equalTo(32) }
        
        secondParticipantTF.snp.makeConstraints { $0.height.equalTo(32) }
        
        eventImagesLabel.snp.makeConstraints {
            $0.top.equalTo(secondParticipantTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        imageButton.snp.makeConstraints {
            $0.centerY.equalTo(eventImagesLabel.snp.centerY)
            $0.leading.equalTo(eventImagesLabel.snp.trailing).inset(-20)
            $0.height.equalTo(24)
            $0.width.equalTo(80)
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
            $0.height.equalTo(40)
            $0.width.equalTo(120)
        }
    }
}
