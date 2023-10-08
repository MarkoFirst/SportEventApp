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

class EventCreatorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var eventTitleTF: UITextField!
    var eventDescriptionTF: UITextField!
    var eventDatePicker: UIDatePicker!
    var currencyPicker: UIPickerView!
    var currencyTextField: UITextField!
    var typeOfSportPicker: UIPickerView!
    var typeOfSportTextField: UITextField!
    
    let allCurrencies: [CurrencyList] = [.USD, .EUR, .JPY, .GBP, .AUD, .CAD, .CHF, .CNY, .INR, .KRW, .BRL, .UAH, .TRY, .MXN, .SGD, .NZD, .HKD, .ZAR, .SEK, .NOK]
    let allTypeOfSport: [TypeOfSport] = [.football, .basketball, .volleyball, .tennis, .pingpong, .chess, .poker, .fencing, .cybersport, .other]
    
    var titleLabel: String?
    var descriptionLabel: String?
    var datePickerValue: Date?
    var currencyPickerValue: CurrencyList?
    var eventTypePickerValue: TypeOfSport?
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
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
        }
        
        let eventCurrencyLabel = UILabel()
        eventCurrencyLabel.text = "4. Event currency:"
        eventCurrencyLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventCurrencyLabel)
        
        eventCurrencyLabel.snp.makeConstraints {
            $0.top.equalTo(eventDatePicker.snp.bottom).inset(-24)
            $0.leading.equalToSuperview().inset(20)
        }
        currencyPicker = UIPickerView()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        currencyTextField = UITextField()
        view.addSubview(currencyTextField)
        currencyTextField.snp.makeConstraints {
            $0.centerY.equalTo(eventCurrencyLabel.snp.centerY)
            $0.leading.equalTo(eventCurrencyLabel.snp.trailing).inset(-4)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        currencyTextField.borderStyle = .roundedRect
        currencyTextField.placeholder = "Select currency"
        currencyTextField.inputView = currencyPicker
        currencyTextField.delegate = self
        
        let eventTypeOfSportLabel = UILabel()
        eventTypeOfSportLabel.text = "5. Event type:"
        eventTypeOfSportLabel.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(eventTypeOfSportLabel)
        
        eventTypeOfSportLabel.snp.makeConstraints {
            $0.top.equalTo(currencyTextField.snp.bottom).inset(-24)
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
            $0.height.equalTo(40)
        }
        
        typeOfSportTextField.borderStyle = .roundedRect
        typeOfSportTextField.placeholder = "Select event type"
        typeOfSportTextField.inputView = typeOfSportPicker
        typeOfSportTextField.delegate = self
        
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
        currencyPickerValue = CurrencyList(rawValue: currencyTextField.text!) ?? CurrencyList.USD
        eventTypePickerValue = TypeOfSport(rawValue: typeOfSportTextField.text!) ?? TypeOfSport.other
        print(titleLabel)
        print(descriptionLabel)
        print(datePickerValue)
        print(currencyPickerValue)
        print(eventTypePickerValue)
        
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(EventCreatorVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case currencyPicker:
            return allCurrencies.count
        case typeOfSportPicker:
            return allTypeOfSport.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case currencyPicker:
            return allCurrencies[row].rawValue
        case typeOfSportPicker:
            return allTypeOfSport[row].rawValue
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case currencyPicker:
            currencyTextField.text = allCurrencies[row].rawValue
        case typeOfSportPicker:
            typeOfSportTextField.text = allTypeOfSport[row].rawValue
        default:
            return
        }
    }
}
