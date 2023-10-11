//
//  AddEventVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.10.2023.
//

import UIKit
import SnapKit

class AddEventVC: UIViewController {
    
    private var titleTF: CustomTF!
    private var descTF: CustomTF!
    private var firstTeamTF: CustomTF!
    private var secondTeamTF: CustomTF!
    private var coverImageView: UIImageView!
    private var datePicker: UIDatePicker!
    private var selectedDate: Date?
    private var teamPicker: UIPickerView!
    
    lazy var teams: [Team] = []
    
    let service = CoreDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        teams = fetchTeamData()
        setupView()
        dismissKeyboard()
    }
    
    @objc func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
    }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func createEvent() {
        guard let coverImage = coverImageView.image else { return }
        guard let date = selectedDate else { return }
        
        var coverData: Data? = nil
        
        if let imageData = coverImage.jpegData(compressionQuality: 0.8) {
            coverData = imageData
        } else if let pngImageData = coverImage.pngData() {
            coverData = pngImageData
        } else {
            return
        }
        
        let title = titleTF.textField.text ?? ""
        let desc = descTF.textField.text ?? ""
        let firstTeam = firstTeamTF.textField.text ?? ""
        let secondTeam = secondTeamTF.textField.text ?? ""
        
        service.createNewEvent(cover: coverData!, title: title, desc: desc, firstTeam: firstTeam, secondTeam: secondTeam, date: date)
        
        // MARK: Update the list of events on the HomeVC

        if let homeVC = presentingViewController as? HomeVC {
            homeVC.events = service.getEvents()
            homeVC.tableView.reloadData()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func openTeamPicker(_ sender: UITextField) {
        sender.inputView = teamPicker
    }
}

extension AddEventVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            coverImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddEventVC: UIPickerViewDataSource, UIPickerViewDelegate {
    // Number of components in the selection (usually 1)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of rows in the selection
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
    
    // Display the text for each row in the selection
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teams[row].name
    }
    
    // Called when one of the rows in the selection is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let selectedTeam = teams[row]
            
            if firstTeamTF.textField.isFirstResponder {
                firstTeamTF.textField.text = selectedTeam.name
            } else if secondTeamTF.textField.isFirstResponder {
                secondTeamTF.textField.text = selectedTeam.name
            }
            
        // Hide picker after selection
            pickerView.resignFirstResponder()
    }
}

extension AddEventVC {
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        // MARK: Configure views
        
        let closeButtonView = UIView()
        
        let closeButton = UIButton()
        let tintColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        closeButton.setImage(UIImage(named: "xmark")?.withTintColor(tintColor), for: .normal)
        closeButton.layer.cornerRadius = 16
        closeButton.layer.borderWidth = 0.5
        closeButton.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        closeButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        
        let createEventButton = UIButton(type: .system)
        createEventButton.setTitle("Create", for: .normal)
        createEventButton.setTitleColor(UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1), for: .normal)
        createEventButton.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        
        coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.image = UIImage(named: "mask")
        coverImageView.clipsToBounds = true
        
        let uploadCoverButton = UIButton(type: .system)
        uploadCoverButton.setTitle("Upload cover", for: .normal)
        uploadCoverButton.setTitleColor(UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1), for: .normal)
        uploadCoverButton.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        
        let iconTintColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
        
        guard let titleImage = UIImage(named: "title") else { return }
        titleTF = CustomTF()
        titleTF.configure(
            image: titleImage.withTintColor(iconTintColor),
            placeholder: "Event title",
            textContentType: .name,
            keyboardType: .default, isSecureTextEntry: false
        )
        
        guard let titleImage = UIImage(named: "desc") else { return }
        descTF = CustomTF()
        descTF.configure(
            image: titleImage.withTintColor(iconTintColor),
            placeholder: "Event description",
            textContentType: .name,
            keyboardType: .default, isSecureTextEntry: false
        )
        
        guard let teamImage = UIImage(named: "team") else { return }
        firstTeamTF = CustomTF()
        firstTeamTF.configure(
            image: teamImage.withTintColor(iconTintColor),
            placeholder: "First team name",
            textContentType: .name,
            keyboardType: .default, isSecureTextEntry: false
        )
        firstTeamTF.textField.addTarget(self, action: #selector(openTeamPicker(_:)), for: .editingDidBegin)
        
        secondTeamTF = CustomTF()
        secondTeamTF.configure(
            image: teamImage.withTintColor(iconTintColor),
            placeholder: "Second team name",
            textContentType: .name,
            keyboardType: .default, isSecureTextEntry: false
        )
        secondTeamTF.textField.addTarget(self, action: #selector(openTeamPicker(_:)), for: .editingDidBegin)
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
      
        teamPicker = UIPickerView()
        teamPicker.dataSource = self
        teamPicker.delegate = self
        firstTeamTF.textField.inputView = teamPicker
        secondTeamTF.textField.inputView = teamPicker
        
        // MARK: Adding views
        
        view.addSubview(closeButtonView)
        view.addSubview(coverImageView)
        view.addSubview(uploadCoverButton)
        view.addSubview(titleTF)
        view.addSubview(descTF)
        view.addSubview(datePicker)
        view.addSubview(firstTeamTF)
        view.addSubview(secondTeamTF)
        
        closeButtonView.addSubview(closeButton)
        closeButtonView.addSubview(createEventButton)
        
        // MARK: Setup constraints
        
        closeButtonView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(52)
        }
        
        closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(closeButtonView.snp.centerY)
            make.leading.equalTo(closeButtonView).offset(16)
            make.size.equalTo(32)
        }
        
        createEventButton.snp.makeConstraints { make in
            make.centerY.equalTo(closeButtonView.snp.centerY)
            make.trailing.equalTo(closeButtonView).offset(-16)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.top.equalTo(closeButtonView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(coverImageView.snp.width).multipliedBy(0.5625)
        }
        
        uploadCoverButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(coverImageView.snp.bottom).offset(16)
            make.height.equalTo(24)
        }
        
        titleTF.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(uploadCoverButton.snp.bottom).offset(16)
        }
        
        descTF.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(titleTF.snp.bottom).offset(16)
        }
        
        firstTeamTF.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(descTF.snp.bottom).offset(16)
        }
        
        secondTeamTF.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(firstTeamTF.snp.bottom).offset(16)
        }
        
        datePicker.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(secondTeamTF.snp.bottom).offset(16)
            make.height.equalTo(48)
        }
    }
}
