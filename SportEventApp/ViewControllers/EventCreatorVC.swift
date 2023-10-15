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
    private let emptyLine = ""
    
    var eventTitleTF: UITextField!
    var eventDescriptionTF: UITextField!
    var eventDatePicker: UIDatePicker!
    var typeOfSportPicker: UIPickerView!
    var typeOfSportTF: UITextField!
    var placePicker: UIPickerView!
    var placeTF: UITextField!
    var gameTypePicker: UIPickerView!
    var gameTypeTF: UITextField!
    var firstParticipantPicker: UIPickerView!
    var secondParticipantPicker: UIPickerView!
    var firstParticipantTF: UITextField!
    var secondParticipantTF: UITextField!
    var imagePicker: UIImagePickerController!
    
    var teams: Results<Team>?
    var athletes: Results<Athlete>?
    var allPlces: Results<Place>?
    var filteredPlaces: [Place] = []
    var filteredTeamsParticipants: [Team] = []
    var filteredAthletesParticipants: [Athlete] = []
    var eventType: TypeOfSport?
    var eventFirstParticipant: Participant?
    var eventSecondParticipant: Participant?
    var eventImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @objc func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @objc func addDefaultEvents(_ sender: UIButton) {
        let realmDB = RealmDB()
        realmDB.createDefaultEvents()
    }
    
}

extension EventCreatorVC {
    
    @objc func tapCreateEvent() {
        let title = eventTitleTF.text ?? emptyLine
        let desc = eventDescriptionTF.text ?? emptyLine
        let date = eventDatePicker.date
        let typeOfSport = eventType?.rawValue ?? emptyLine
        let place = realm.objects(Place.self).filter( {$0.name == self.placeTF.text} ).first
        let gameType = gameTypeTF.text ?? emptyLine
        var image: Data {
            if let eventImage_ = eventImage?.jpegData(compressionQuality: 0.3) {
                return eventImage_
            } else {
                return UIImage(named: "eventDefaultImage")!.jpegData(compressionQuality: 0.3)!
            }
        }
        
        guard !title.isEmpty, !desc.isEmpty, !typeOfSport.isEmpty, place != nil, eventFirstParticipant != nil, eventSecondParticipant != nil, !gameType.isEmpty else {
            showAlert(title: "Oops!", message: "Fill in all fields!")
            return
        }

        switch [eventFirstParticipant, eventSecondParticipant] {
        case is [Team]:
            let firstTeam = realm.objects(Team.self).filter( {$0.name == self.firstParticipantTF.text} ).first
            let secondTeam = realm.objects(Team.self).filter( {$0.name == self.secondParticipantTF.text} ).first
            let teamsList = List<Team>()
            teamsList.append(objectsIn: [firstTeam, secondTeam].compactMap { $0 })

            let event = TeamSportEvent()
            event.title = title
            event.desc = desc
            event.date = date
            event.typeOfSport = typeOfSport
            event.place = place
            event.currency = place?.currency ?? CurrencyList.USD.rawValue
            event.icon = image
            event.teams = teamsList

            addEvent(event: event)

        case is [Athlete]:
            let firstAthlete = realm.objects(Athlete.self).filter( {$0.lastName == self.firstParticipantTF.text} ).first
            let secondAthlete = realm.objects(Athlete.self).filter( {$0.lastName == self.secondParticipantTF.text} ).first
            let athletesList = List<Athlete>()
            athletesList.append(objectsIn: [firstAthlete, secondAthlete].compactMap { $0 })

            let event = DoublesSportEvent()
            event.title = title
            event.desc = desc
            event.date = date
            event.typeOfSport = typeOfSport
            event.place = place
            event.currency = place?.currency ?? CurrencyList.USD.rawValue
            event.icon = image
            event.athletes = athletesList

            addEvent(event: event)

        default: return
        }
    }
    
    private func addEvent(event: Event) {
        try! realm.write {
            realm.add(event, update: .error)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
            switch gameTypeTF.text {
            case TypeOfGame.team.rawValue:
                return filteredTeamsParticipants.count
            case TypeOfGame.double.rawValue:
                return filteredAthletesParticipants.count
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
            if gameTypeTF.text == TypeOfGame.team.rawValue {
                return filteredTeamsParticipants[row].name
            } else {
                return filteredAthletesParticipants[row].lastName
            }
        default: return emptyLine
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case typeOfSportPicker:
            let placeType: TypeOfSport = TypeOfSport.allCases[row]
            typeOfSportTF.text = TypeOfSport.allCases[row].rawValue
            eventType = TypeOfSport.allCases[row]
            filteredPlaces = allPlces?.filter { $0.typeSport.contains(placeType.rawValue) } ?? []
            filteredTeamsParticipants = teams?.filter { $0.sport.contains(placeType.rawValue) } ?? []
            filteredAthletesParticipants = athletes?.filter { $0.typeOfSport.contains(placeType.rawValue) } ?? []
            [placeTF, firstParticipantTF, secondParticipantTF].forEach {$0?.text = emptyLine}
            [placePicker, firstParticipantPicker, secondParticipantPicker].forEach {$0?.reloadAllComponents()}
        case placePicker:
            placeTF.text = filteredPlaces.isEmpty ? emptyLine : filteredPlaces[row].name
        case gameTypePicker:
            gameTypeTF.text = TypeOfGame.allCases[row].rawValue
            [firstParticipantTF, secondParticipantTF].forEach {$0?.text = emptyLine}
            [firstParticipantPicker, secondParticipantPicker].forEach {$0?.reloadAllComponents()}
        case firstParticipantPicker:
            switch gameTypeTF.text {
            case TypeOfGame.team.rawValue:
                if filteredTeamsParticipants.isEmpty {
                    firstParticipantTF.text = emptyLine
                } else {
                    firstParticipantTF.text = filteredTeamsParticipants[row].name
                    eventFirstParticipant = teams?.first(where: { $0.name == firstParticipantTF.text } )
                }
            case TypeOfGame.double.rawValue:
                if filteredAthletesParticipants.isEmpty {
                    firstParticipantTF.text = emptyLine
                } else {
                    firstParticipantTF.text = filteredAthletesParticipants[row].lastName
                    eventFirstParticipant = athletes?.first(where: { $0.lastName == firstParticipantTF.text } )
                }
            default: return
            }
        case secondParticipantPicker:
            switch gameTypeTF.text {
            case TypeOfGame.team.rawValue:
                if filteredTeamsParticipants.isEmpty{
                    secondParticipantTF.text = emptyLine
                } else {
                    secondParticipantTF.text = filteredTeamsParticipants[row].name
                    eventSecondParticipant = teams?.first(where: { $0.name == secondParticipantTF.text } )
                }
            case TypeOfGame.double.rawValue:
                if filteredAthletesParticipants.isEmpty {
                    secondParticipantTF.text = emptyLine
                } else {
                    secondParticipantTF.text = filteredAthletesParticipants[row].lastName
                    eventSecondParticipant = athletes?.first(where: { $0.lastName == secondParticipantTF.text } )
                }
            default: return
            }
        default: return
        }
    }
}

extension EventCreatorVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func setImage() {
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
