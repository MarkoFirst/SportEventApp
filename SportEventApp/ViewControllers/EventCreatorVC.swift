//
//  EventCreatorVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 08.10.2023.
//

import Foundation
import SnapKit
import UIKit
import RealmSwift

class EventCreatorVC: UIViewController {
    
    var eventTitleTF: UITextField!
    var eventDescriptionTF: UITextField!
    var eventDatePicker: UIDatePicker!
    var typeOfSportPicker: UIPickerView!
    var typeOfSportTextField: UITextField!
    var placePicker: UIPickerView!
    var placeTextField: UITextField!
    var gameTypePicker: UIPickerView!
    var gameTypeTextField: UITextField!
    var firstParticipantPicker: UIPickerView!
    var secondParticipantPicker: UIPickerView!
    var firstParticipantTextField: UITextField!
    var secondParticipantTextField: UITextField!
    var imagePicker: UIImagePickerController!
    
    let allTypeOfSport: [TypeOfSport] = [.football, .basketball, .volleyball, .tennis, .pingpong, .chess, .poker, .fencing, .cybersport, .other]
    
    let donbassArena = Place(name: "Donbass Arena", type: .stadium, contry: .Ukraine, maxSpectatorsCount: 52187, typeSport: [.football, .chess, .volleyball], priceFrom: 100, priceTo: 3000, currency: .UAH)
    let arturAsheStadium = Place(name: "Arthur Ashe Stadium", type: .stadium, contry: .UnitedStates, maxSpectatorsCount: 10000, typeSport: [.tennis, .volleyball], priceFrom: 100, priceTo: 3000, currency: .USD)
    let campNou = Place(name: "Camp Nou", type: .stadium, contry: .Spain, maxSpectatorsCount: 99354, typeSport: [.football], priceFrom: 60, priceTo: 2500, currency: .EUR)
    let gameWeb = OnlinePlace(urlAdress: "www.game.com", language: [.English], name: "Game.com", type: .internet, contry: .UnitedStates, maxSpectatorsCount: 1000, typeSport: [.cybersport], priceFrom: 100, priceTo: 1000, currency: .USD)
    
    let juventus = Team(name: "Juventus", createYear: 1897, coach: "Massimiliano Allegri", sport: .football, team: nil, country: .Italy, iconName: "juventusFlag")
    let barcelona = Team(name: "Barcelona", createYear: 1899, coach: "Ronald Koeman", sport: .football, team: nil, country: .Spain, iconName: "barcelonaLogo")
    let psg = Team(name: "Paris Saint-Germain", createYear: 1970, coach: "Mauricio Pochettino", sport: .football, team: nil, country: .France, iconName: "psgLogo")
    let manCity = Team(name: "Manchester City", createYear: 1880, coach: "Pep Guardiola", sport: .football, team: nil, country: .UnitedKingdom, iconName: "mcLogo")
    let realMadrid = Team(name: "Real Madrid", createYear: 1902, coach: "Carlo Ancelotti", sport: .football, team: nil, country: .Spain, iconName: "realLogo")
    let navi = Team(name: "Natus Vincere", createYear: 2009, coach: "Andrey Gorodenskiy", sport: .cybersport, team: nil, country: .Ukraine, iconName: "naviLogo")
    let virtuspro = Team(name: "Virtus.pro", createYear: 2003, coach: "Dzhami Ali", sport: .cybersport, team: nil, country: .Other, iconName: "virtusproLogo")
    
    let djokovic = Athlete(firstName: "Novak", lastName: "Djokovic", age: 34, typeOfSport: .tennis, gamesValue: 18, goalsValue: 12, athleteTeam: nil, atheleBigImageName: "djokovicFlag", athleteRole: "TENNIS PLAYER", allKicks: 142, shotOnTarget: 92, goalsScored: 32, foulsWon: 25, foulsConceded: 8, redCards: 0, yellowCards: 2, trophies: nil, teams: nil, citizenship: .Serbia, birthplace: .Other, gender: .male, sport: .tennis, number: 1, iconName: "djokovicLogo")
    let nadal = Athlete(firstName: "Rafael", lastName: "Nadal", age: 35, typeOfSport: .tennis, gamesValue: 20, goalsValue: 15, athleteTeam: nil, atheleBigImageName: "nadalFlag", athleteRole: "TENNIS PLAYER", allKicks: 155, shotOnTarget: 105, goalsScored: 40, foulsWon: 28, foulsConceded: 10, redCards: 0, yellowCards: 1, trophies: nil, teams: nil, citizenship: .Spain, birthplace: .Other, gender: .male, sport: .tennis, number: 2, iconName: "nadaleLogo")
    
    var teams: [Team] = []
    var athletes: [Athlete] = []
    var allPlces: [Place]?
    var filteredPlaces: [Place] = []
    var gameType: [TypeOfGame] = [.double, .team]
    
    var titleLabel: String?
    var descriptionLabel: String?
    var datePickerValue: Date?
    var eventTypePickerValue: TypeOfSport?
    var eventPlacePickerValue: Place?
    var gameTypePickerValue: TypeOfGame?
    var firstParticipant: Participant?
    var secondParticipant: Participant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPlces = [donbassArena, arturAsheStadium, campNou, gameWeb]
        teams = [juventus, barcelona, psg, manCity, realMadrid, navi, virtuspro]
        athletes = [djokovic, nadal]
        
        self.setupView()
        self.dismissKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension EventCreatorVC: UITextFieldDelegate {
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        let mainLabel = UILabel()
        mainLabel.text = "Create event"
        mainLabel.font = .boldSystemFont(ofSize: 32)
        view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(20)
        }
        
        let eventTitleLabel = UILabel()
        eventTitleLabel.text = "1. Event title:"
        eventTitleLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventTitleLabel)
        
        eventTitleLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventTitleTF = UITextField()
        eventTitleTF.placeholder = "Title"
        eventTitleTF.borderStyle = .line
        eventTitleTF.backgroundColor = .white
        eventTitleTF.textColor = .black
        eventTitleTF.delegate = self
        view.addSubview(eventTitleTF)
        eventTitleTF.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(28)
        }
        
        let eventDescriptionLabel = UILabel()
        eventDescriptionLabel.text = "2. Event description:"
        eventDescriptionLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventDescriptionLabel)
        
        eventDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(eventTitleTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventDescriptionTF = UITextField()
        eventDescriptionTF.placeholder = "Description"
        eventDescriptionTF.borderStyle = .line
        eventDescriptionTF.backgroundColor = .white
        eventDescriptionTF.textColor = .black
        eventDescriptionTF.delegate = self
        view.addSubview(eventDescriptionTF)
        eventDescriptionTF.snp.makeConstraints {
            $0.top.equalTo(eventDescriptionLabel.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(28)
        }
        
        let eventDateLabel = UILabel()
        eventDateLabel.text = "3. Event date:"
        eventDateLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventDateLabel)
        
        eventDateLabel.snp.makeConstraints {
            $0.top.equalTo(eventDescriptionTF.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        eventDatePicker = UIDatePicker()
        eventDatePicker.datePickerMode = .dateAndTime
        eventDatePicker.preferredDatePickerStyle = .compact
        eventDatePicker.backgroundColor = .clear
        view.addSubview(eventDatePicker)
        eventDatePicker.snp.makeConstraints {
            $0.centerY.equalTo(eventDateLabel.snp.centerY)
            $0.leading.equalTo(eventDateLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        let eventTypeOfSportLabel = UILabel()
        eventTypeOfSportLabel.text = "4. Event type:"
        eventTypeOfSportLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventTypeOfSportLabel)
        
        eventTypeOfSportLabel.snp.makeConstraints {
            $0.top.equalTo(eventDatePicker.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        typeOfSportPicker = UIPickerView()
        typeOfSportPicker.delegate = self
        typeOfSportPicker.dataSource = self
        
        typeOfSportTextField = UITextField()
        view.addSubview(typeOfSportTextField)
        typeOfSportTextField.snp.makeConstraints {
            $0.centerY.equalTo(eventTypeOfSportLabel.snp.centerY)
            $0.leading.equalTo(eventTypeOfSportLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        typeOfSportTextField.borderStyle = .roundedRect
        typeOfSportTextField.placeholder = "Select event type"
        typeOfSportTextField.inputView = typeOfSportPicker
        typeOfSportTextField.delegate = self
        
        let eventPlaceLabel = UILabel()
        eventPlaceLabel.text = "5. Event place:"
        eventPlaceLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventPlaceLabel)
        
        eventPlaceLabel.snp.makeConstraints {
            $0.top.equalTo(typeOfSportTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        placePicker = UIPickerView()
        placePicker.delegate = self
        placePicker.dataSource = self
        
        placeTextField = UITextField()
        view.addSubview(placeTextField)
        placeTextField.snp.makeConstraints {
            $0.centerY.equalTo(eventPlaceLabel.snp.centerY)
            $0.leading.equalTo(eventPlaceLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        placeTextField.borderStyle = .roundedRect
        placeTextField.placeholder = "Select event place"
        placeTextField.inputView = placePicker
        placeTextField.delegate = self
        
        let gameTypeLabel = UILabel()
        gameTypeLabel.text = "6. Game type:"
        gameTypeLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(gameTypeLabel)
        
        gameTypeLabel.snp.makeConstraints {
            $0.top.equalTo(placeTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        gameTypePicker = UIPickerView()
        gameTypePicker.delegate = self
        gameTypePicker.dataSource = self
        
        gameTypeTextField = UITextField()
        view.addSubview(gameTypeTextField)
        gameTypeTextField.snp.makeConstraints {
            $0.centerY.equalTo(gameTypeLabel.snp.centerY)
            $0.leading.equalTo(gameTypeLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        gameTypeTextField.borderStyle = .roundedRect
        gameTypeTextField.placeholder = "Select game type"
        gameTypeTextField.inputView = gameTypePicker
        gameTypeTextField.delegate = self
        
        let eventParticipantsLabel = UILabel()
        eventParticipantsLabel.text = "7. Event participants:"
        eventParticipantsLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventParticipantsLabel)
        
        eventParticipantsLabel.snp.makeConstraints {
            $0.top.equalTo(gameTypeTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        let participantsStackView = UIStackView()
        participantsStackView.axis = .horizontal
        participantsStackView.spacing = 8
        participantsStackView.distribution = .fillProportionally
        participantsStackView.alignment = .center
        view.addSubview(participantsStackView)
        
        participantsStackView.snp.makeConstraints {
            $0.top.equalTo(eventParticipantsLabel.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        firstParticipantPicker = UIPickerView()
        firstParticipantPicker.delegate = self
        firstParticipantPicker.dataSource = self
        
        firstParticipantTextField = UITextField()
        participantsStackView.addArrangedSubview(firstParticipantTextField)
        firstParticipantTextField.snp.makeConstraints {
            $0.height.equalTo(32)
        }
        
        firstParticipantTextField.borderStyle = .roundedRect
        firstParticipantTextField.placeholder = "Select first participant"
        firstParticipantTextField.inputView = firstParticipantPicker
        firstParticipantTextField.delegate = self
        
        let vsLabel = UILabel()
        vsLabel.text = "vs."
        vsLabel.textAlignment = .center
        vsLabel.font = UIFont(name: "Helvetica", size: 20)
        participantsStackView.addArrangedSubview(vsLabel)
        vsLabel.snp.makeConstraints {
            $0.size.equalTo(32)
        }
        secondParticipantPicker = UIPickerView()
        secondParticipantPicker.delegate = self
        secondParticipantPicker.dataSource = self
        
        secondParticipantTextField = UITextField()
        participantsStackView.addArrangedSubview(secondParticipantTextField)
        secondParticipantTextField.snp.makeConstraints {
            $0.height.equalTo(32)
        }
        
        secondParticipantTextField.borderStyle = .roundedRect
        secondParticipantTextField.placeholder = "Select second participant"
        secondParticipantTextField.inputView = secondParticipantPicker
        secondParticipantTextField.delegate = self
        
        
        imagePicker = UIImagePickerController()
        
        
        
        
        
        
        
        let button = UIButton(type: .system)
        button.titleLabel?.text = "Ok"
        button.tintColor = UIColor(red: 0.973, green: 0.98, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.backgroundColor = UIColor(red: 0.184, green: 0.486, blue: 0.965, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapOk), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(40)
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
    }
    
    @objc private func tapOk() {
        titleLabel = eventTitleTF.text ?? ""
        descriptionLabel = eventDescriptionTF.text ?? ""
        datePickerValue = eventDatePicker.date
        eventTypePickerValue = TypeOfSport(rawValue: typeOfSportTextField.text!) ?? TypeOfSport.other
        eventPlacePickerValue = allPlces?.first(where: { $0.name == placeTextField.text } )
        gameTypePickerValue = TypeOfGame(rawValue: gameTypeTextField.text!) ?? TypeOfGame.team
        //        print(titleLabel)
        //        print(descriptionLabel)
        //        print(datePickerValue)
        //        print(eventTypePickerValue)
        //        print(eventPlacePickerValue)
        //        print(gameTypePickerValue)
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(EventCreatorVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
    
    extension EventCreatorVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
            
        case typeOfSportPicker:
            return allTypeOfSport.count
        case placePicker:
            return filteredPlaces.count
        case gameTypePicker:
            return gameType.count
        case firstParticipantPicker, secondParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue {
                return teams.count
            } else {
                return athletes.count
            }
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
            
        case typeOfSportPicker:
            return allTypeOfSport[row].rawValue
        case placePicker:
            return filteredPlaces[row].name
        case gameTypePicker:
            return gameType[row].rawValue
        case firstParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue {
                return teams[row].name
            } else {
                return athletes[row].lastName
            }
            
        case secondParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue {
                return teams[row].name
            } else {
                return athletes[row].lastName
            }
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
            
        case typeOfSportPicker:
            let placeType: TypeOfSport = allTypeOfSport[row]
            typeOfSportTextField.text = allTypeOfSport[row].rawValue
            filteredPlaces = allPlces?.filter { $0.typeSport.contains(placeType) } ?? []
            placeTextField.text = ""
            placePicker.reloadAllComponents()
            
        case placePicker:
            if filteredPlaces.isEmpty {
                placeTextField.text = ""
            } else {
                placeTextField.text = filteredPlaces[row].name
            }
            
        case gameTypePicker:
            gameTypeTextField.text = gameType[row].rawValue
            firstParticipantTextField.text = ""
            secondParticipantTextField.text = ""
            firstParticipantPicker.reloadAllComponents()
            secondParticipantPicker.reloadAllComponents()
            
        case firstParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue && !teams.isEmpty {
                firstParticipantTextField.text = teams[row].name
            } else if gameTypeTextField.text == TypeOfGame.double.rawValue && !athletes.isEmpty{
                firstParticipantTextField.text = athletes[row].lastName
            }
            
        case secondParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue && !teams.isEmpty {
                secondParticipantTextField.text = teams[row].name
            } else if gameTypeTextField.text == TypeOfGame.double.rawValue && !athletes.isEmpty{
                secondParticipantTextField.text = athletes[row].lastName
            }
            
        default:
            return
        }
    }
}

extension EventCreatorVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
}
