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
    
    let realm = try! Realm()
    
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
    
    var teams: Results<Team>?
    var athletes: Results<Athlete>?
    var allPlces: Results<Place>?
    var filteredPlaces: [Place] = []
    var eventType: TypeOfSport?
    var eventFirstParticipant: Participant?
    var eventSecondParticipant: Participant?
    var eventImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        teams = realm.objects(Team.self)
        athletes = realm.objects(Athlete.self)
        allPlces = realm.objects(Place.self)
        self.setupView()
        self.dismissKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

extension EventCreatorVC: UITextFieldDelegate {
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        let mainLabel = UILabel()
        mainLabel.text = "Create event"
        mainLabel.font = .boldSystemFont(ofSize: 32)
        view.addSubview(mainLabel)
        
        let eventTitleLabel = UILabel()
        eventTitleLabel.text = "1. Event title:"
        eventTitleLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventTitleLabel)
        
        eventTitleTF = UITextField()
        eventTitleTF.placeholder = "Title"
        eventTitleTF.borderStyle = .line
        eventTitleTF.backgroundColor = .white
        eventTitleTF.textColor = .black
        eventTitleTF.delegate = self
        view.addSubview(eventTitleTF)
        
        let eventDescriptionLabel = UILabel()
        eventDescriptionLabel.text = "2. Event description:"
        eventDescriptionLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventDescriptionLabel)
        
        eventDescriptionTF = UITextField()
        eventDescriptionTF.placeholder = "Description"
        eventDescriptionTF.borderStyle = .line
        eventDescriptionTF.backgroundColor = .white
        eventDescriptionTF.textColor = .black
        eventDescriptionTF.delegate = self
        view.addSubview(eventDescriptionTF)
        
        let eventDateLabel = UILabel()
        eventDateLabel.text = "3. Event date:"
        eventDateLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventDateLabel)
        
        eventDatePicker = UIDatePicker()
        eventDatePicker.datePickerMode = .dateAndTime
        eventDatePicker.preferredDatePickerStyle = .compact
        eventDatePicker.backgroundColor = .clear
        view.addSubview(eventDatePicker)
        
        let eventTypeOfSportLabel = UILabel()
        eventTypeOfSportLabel.text = "4. Event type:"
        eventTypeOfSportLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventTypeOfSportLabel)
        
        typeOfSportPicker = UIPickerView()
        typeOfSportPicker.delegate = self
        typeOfSportPicker.dataSource = self
        
        typeOfSportTextField = UITextField()
        view.addSubview(typeOfSportTextField)
        
        typeOfSportTextField.borderStyle = .roundedRect
        typeOfSportTextField.placeholder = "Select event type"
        typeOfSportTextField.inputView = typeOfSportPicker
        typeOfSportTextField.delegate = self
        
        let eventPlaceLabel = UILabel()
        eventPlaceLabel.text = "5. Event place:"
        eventPlaceLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventPlaceLabel)
        
        placePicker = UIPickerView()
        placePicker.delegate = self
        placePicker.dataSource = self
        
        placeTextField = UITextField()
        view.addSubview(placeTextField)
        
        placeTextField.borderStyle = .roundedRect
        placeTextField.placeholder = "Select event place"
        placeTextField.inputView = placePicker
        placeTextField.delegate = self
        
        let gameTypeLabel = UILabel()
        gameTypeLabel.text = "6. Game type:"
        gameTypeLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(gameTypeLabel)
        
        gameTypePicker = UIPickerView()
        gameTypePicker.delegate = self
        gameTypePicker.dataSource = self
        
        gameTypeTextField = UITextField()
        view.addSubview(gameTypeTextField)
        
        gameTypeTextField.borderStyle = .roundedRect
        gameTypeTextField.placeholder = "Select game type"
        gameTypeTextField.inputView = gameTypePicker
        gameTypeTextField.delegate = self
        
        let eventParticipantsLabel = UILabel()
        eventParticipantsLabel.text = "7. Event participants:"
        eventParticipantsLabel.font = UIFont(name: "Helvetica", size: 20)
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
        
        firstParticipantTextField = UITextField()
        participantsStackView.addArrangedSubview(firstParticipantTextField)
        
        firstParticipantTextField.borderStyle = .roundedRect
        firstParticipantTextField.placeholder = "Select first participant"
        firstParticipantTextField.inputView = firstParticipantPicker
        firstParticipantTextField.delegate = self
        
        let vsLabel = UILabel()
        vsLabel.text = "vs."
        vsLabel.textAlignment = .center
        vsLabel.font = UIFont(name: "Helvetica", size: 20)
        participantsStackView.addArrangedSubview(vsLabel)
        
        secondParticipantPicker = UIPickerView()
        secondParticipantPicker.delegate = self
        secondParticipantPicker.dataSource = self
        
        secondParticipantTextField = UITextField()
        participantsStackView.addArrangedSubview(secondParticipantTextField)
        
        secondParticipantTextField.borderStyle = .roundedRect
        secondParticipantTextField.placeholder = "Select second participant"
        secondParticipantTextField.inputView = secondParticipantPicker
        secondParticipantTextField.delegate = self
        
        let eventImagesLabel = UILabel()
        eventImagesLabel.text = "8. Event image:"
        eventImagesLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventImagesLabel)
        
        let imageButton = UIButton(type: .system)
        imageButton.setTitle("Select", for: .normal)
        imageButton.tintColor = .black
        imageButton.layer.cornerRadius = 4
        imageButton.layer.borderWidth = 1
        imageButton.layer.borderColor = UIColor.black.cgColor
        imageButton.addTarget(self, action: #selector(setImage), for: .touchUpInside)
        view.addSubview(imageButton)
        
        let button = UIButton(type: .system)
        button.setTitle("Create event", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        view.addSubview(button)
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
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
        
        typeOfSportTextField.snp.makeConstraints {
            $0.centerY.equalTo(eventTypeOfSportLabel.snp.centerY)
            $0.leading.equalTo(eventTypeOfSportLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        eventPlaceLabel.snp.makeConstraints {
            $0.top.equalTo(typeOfSportTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        placeTextField.snp.makeConstraints {
            $0.centerY.equalTo(eventPlaceLabel.snp.centerY)
            $0.leading.equalTo(eventPlaceLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        gameTypeLabel.snp.makeConstraints {
            $0.top.equalTo(placeTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        gameTypeTextField.snp.makeConstraints {
            $0.centerY.equalTo(gameTypeLabel.snp.centerY)
            $0.leading.equalTo(gameTypeLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        eventParticipantsLabel.snp.makeConstraints {
            $0.top.equalTo(gameTypeTextField.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        participantsStackView.snp.makeConstraints {
            $0.top.equalTo(eventParticipantsLabel.snp.bottom).inset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        firstParticipantTextField.snp.makeConstraints { $0.height.equalTo(32) }
        
        vsLabel.snp.makeConstraints { $0.size.equalTo(32) }
        
        secondParticipantTextField.snp.makeConstraints { $0.height.equalTo(32) }
        
        eventImagesLabel.snp.makeConstraints {
            $0.top.equalTo(secondParticipantTextField.snp.bottom).inset(-24)
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
            $0.bottom.equalToSuperview().inset(40)
            $0.height.equalTo(40)
            $0.width.equalTo(120)
        }
    }
}

extension EventCreatorVC {
    
    @objc private func createEvent() {
        
        let place = realm.objects(Place.self).filter( {$0.name == self.placeTextField.text} ).first
        
        switch [eventFirstParticipant, eventSecondParticipant] {
        case is [Team]:
            let firstTeam = realm.objects(Team.self).filter( {$0.name == self.firstParticipantTextField.text} ).first
            let secondTeam = realm.objects(Team.self).filter( {$0.name == self.secondParticipantTextField.text} ).first
            let teamsList = List<Team>()
            teamsList.append(objectsIn: [firstTeam, secondTeam].compactMap { $0 })
            
            let event = TeamSportEvent()
            event.title = eventTitleTF.text ?? ""
            event.desc = eventDescriptionTF.text ?? ""
            event.date = eventDatePicker.date
            event.typeOfSport = eventType?.rawValue ?? ""
            event.place = place
            event.currency = place?.currency ?? CurrencyList.UAH.rawValue
            if let eventImage_ = eventImage?.jpegData(compressionQuality: 0.3){
                event.icon = eventImage_
            }
            event.teams = teamsList
            
            addEvent(event: event)
            
        case is [Athlete]:
            let firstAthlete = realm.objects(Athlete.self).filter( {$0.lastName == self.firstParticipantTextField.text} ).first
            let secondAthlete = realm.objects(Athlete.self).filter( {$0.lastName == self.secondParticipantTextField.text} ).first
            let athletesList = List<Athlete>()
            athletesList.append(objectsIn: [firstAthlete, secondAthlete].compactMap { $0 })
            
            let event = DoublesSportEvent()
            event.title = eventTitleTF.text ?? ""
            event.desc = eventDescriptionTF.text ?? ""
            event.date = eventDatePicker.date
            event.typeOfSport = eventType?.rawValue ?? ""
            event.place = place
            event.currency = place?.currency ?? CurrencyList.UAH.rawValue
            if let eventImage_ = eventImage?.jpegData(compressionQuality: 0.3){
                event.icon = eventImage_
            }
            event.athletes = athletesList
            
            addEvent(event: event)
            
        default: return
        }
    }
    
    private func getData() {
        let realm = RealmDB()
        realm.addData()
    }
    
    private func addEvent(event: Event) {
        try! realm.write {
            realm.add(event, update: .error)
        }
    }
}

extension EventCreatorVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case typeOfSportPicker:
            return TypeOfSport.allCases.count
        case placePicker:
            return filteredPlaces.count
        case gameTypePicker:
            return TypeOfGame.allCases.count
        case firstParticipantPicker, secondParticipantPicker:
            switch gameTypeTextField.text {
            case TypeOfGame.team.rawValue:
                return teams?.filter { $0.sport == self.typeOfSportTextField.text }.count ?? 0
            case TypeOfGame.double.rawValue:
                return athletes?.filter { $0.typeOfSport == self.typeOfSportTextField.text }.count ?? 0
            default: return 0
            }
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case typeOfSportPicker:
            return TypeOfSport.allCases[row].rawValue
        case placePicker:
            return filteredPlaces[row].name
        case gameTypePicker:
            return TypeOfGame.allCases[row].rawValue
        case firstParticipantPicker, secondParticipantPicker:
            if gameTypeTextField.text == TypeOfGame.team.rawValue {
                return teams?.filter { $0.sport == self.typeOfSportTextField.text }[row].name
            } else {
                return athletes?.filter { $0.typeOfSport == self.typeOfSportTextField.text }[row].lastName
            }
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case typeOfSportPicker:
            let placeType: TypeOfSport = TypeOfSport.allCases[row]
            typeOfSportTextField.text = TypeOfSport.allCases[row].rawValue
            eventType = TypeOfSport.allCases[row]
            filteredPlaces = allPlces?.filter { $0.typeSport.contains(placeType.rawValue) } ?? []
            [placeTextField, firstParticipantTextField, secondParticipantTextField].forEach {$0?.text = ""}
            [placePicker, firstParticipantPicker, secondParticipantPicker].forEach {$0?.reloadAllComponents()}
        case placePicker:
            placeTextField.text = filteredPlaces.isEmpty ? "" : filteredPlaces[row].name
        case gameTypePicker:
            gameTypeTextField.text = TypeOfGame.allCases[row].rawValue
            [firstParticipantTextField, secondParticipantTextField].forEach {$0?.text = ""}
            [firstParticipantPicker, secondParticipantPicker].forEach {$0?.reloadAllComponents()}
        case firstParticipantPicker:
            switch gameTypeTextField.text {
            case TypeOfGame.team.rawValue:
                if teams?.filter( { $0.sport == self.typeOfSportTextField.text } ).count == 0 {
                    firstParticipantTextField.text = ""
                } else {
                    firstParticipantTextField.text = teams?[row].name
                    eventFirstParticipant = teams?.first(where: { $0.name == firstParticipantTextField.text } )
                }
            case TypeOfGame.double.rawValue:
                if athletes?.filter({ $0.typeOfSport == self.typeOfSportTextField.text }).count == 0 {
                    firstParticipantTextField.text = ""
                } else {
                    firstParticipantTextField.text = athletes?[row].lastName
                    eventFirstParticipant = athletes?.first(where: { $0.lastName == firstParticipantTextField.text } )
                }
            default: return
            }
        case secondParticipantPicker:
            switch gameTypeTextField.text {
            case TypeOfGame.team.rawValue:
                if teams?.filter({ $0.sport == self.typeOfSportTextField.text }).count == 0 {
                    secondParticipantTextField.text = ""
                } else {
                    secondParticipantTextField.text = teams?[row].name
                    eventSecondParticipant = teams?.first(where: { $0.name == secondParticipantTextField.text } )
                }
            case TypeOfGame.double.rawValue:
                if athletes?.filter({ $0.typeOfSport == self.typeOfSportTextField.text }).count == 0 {
                    secondParticipantTextField.text = ""
                } else {
                    secondParticipantTextField.text = athletes?[row].lastName
                    eventSecondParticipant = athletes?.first(where: { $0.lastName == secondParticipantTextField.text } )
                }
            default: return
            }
        default: return
        }
    }
}

extension EventCreatorVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc private func setImage() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            eventImage = image
            picker.dismiss(animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
