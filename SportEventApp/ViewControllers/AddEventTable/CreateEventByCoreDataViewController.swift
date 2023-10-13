//
//  CreateEventByCoreDataViewController.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 10.10.2023.
//

import Foundation
import UIKit
import SnapKit
import Photos
import CoreData

class CreateEventByCoreDataViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let eventNameTF = UITextField()
    private let eventDescriptionTF = UITextField()
    private let eventDateTF = UITextField()
    private let date = UIDatePicker()
    private let eventImage = UIImageView()
    private let firstTeamPlayingInEvent = UITextField()
    private let secondTeamPlayingInEvent = UITextField()
    let context = CoreDataService().persistentContainer.viewContext
    var delegateVC: AddEventViewController?
    var delegate = [EventCoreData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Core Data Setup
    extension CreateEventByCoreDataViewController {
        func getAllEvents() {
            do {
                delegate = try context.fetch(EventCoreData.fetchRequest())
                print("Loaded \(delegate.count) items")
                delegateVC?.delegate = delegate
            } catch {
                
            }
        }
        
        func createEvent() {
            let item = EventCoreData(context: context)
            item.eventName = eventNameTF.text
            item.eventDescription = eventDescriptionTF.text
            item.firtsTeam = firstTeamPlayingInEvent.text
            item.secondTeam = secondTeamPlayingInEvent.text
            item.date = eventDateTF.text
            if let image = eventImage.image {
                   if let imageData = image.pngData() {
                       item.eventImage = imageData
                   }
               }
            do {
                try context.save()
            } catch {
                print("Ошибка при сохранении данных: \(error)")
            }
            getAllEvents()
            delegate.append(item)
        }

        func deleteEvent(item: EventCoreData) {
            context.delete(item)
            do {
                try? context.save()
            }
        }
    }

//MARK: - Setup Layout
extension CreateEventByCoreDataViewController {
    func setupLayout() {
        let bgImage = UIImageView(image: UIImage(named: "SignUpBG"))
        bgImage.isUserInteractionEnabled = true
        view.addSubview(bgImage)
        bgImage.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let mainSV = UIStackView()
        mainSV.axis = .vertical
        mainSV.spacing = 16
        mainSV.isUserInteractionEnabled = true
        bgImage.addSubview(mainSV)
        
        mainSV.snp.makeConstraints {
            $0.top.equalTo(bgImage).inset(100)
            $0.leading.trailing.equalTo(bgImage).inset(16)
        }
        
        let addImageView = UIView()
        addImageView.backgroundColor = .white
        addImageView.layer.cornerRadius = 10
        addImageView.layer.borderColor = UIColor.red.cgColor
        addImageView.layer.borderWidth = 2
        mainSV.addArrangedSubview(addImageView)
        
        addImageView.snp.makeConstraints {
            $0.left.right.equalTo(mainSV)
            $0.height.equalTo(150)
        }
        
        eventImage.backgroundColor = .lightGray.withAlphaComponent(0.3)
        eventImage.layer.cornerRadius = 10
        
        addImageView.addSubview(eventImage)
        
        eventImage.snp.makeConstraints {
            $0.top.right.bottom.equalTo(addImageView).inset(16)
            $0.width.equalTo(118)
        }
        
        let loadBtn = UIButton()
        loadBtn.setTitle("Add image", for: .normal)
        loadBtn.setTitleColor(.red, for: .normal)
        loadBtn.backgroundColor = .clear
        loadBtn.layer.borderWidth = 2
        loadBtn.layer.cornerRadius = 10
        loadBtn.layer.borderColor = UIColor.red.cgColor
        
        loadBtn.addTarget(self, action: #selector(getImageFromDevice), for: .touchUpInside)
        addImageView.addSubview(loadBtn)
        
        loadBtn.snp.makeConstraints {
            $0.left.equalTo(addImageView.snp.left).inset(16)
            $0.centerY.equalTo(addImageView.snp.centerY)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        date.datePickerMode = .dateAndTime
        date.preferredDatePickerStyle = .wheels
        
        let textFieldsArray : [(String, UITextField)] = [
            ("Event Name", eventNameTF),
            ("Event Description", eventDescriptionTF),
            ("Enter the name of 1st team", firstTeamPlayingInEvent),
            ("Enter the name of 2nd team", secondTeamPlayingInEvent),
            ("Choose the date and time of event", eventDateTF)
        ]
        
        let eventStackView = UIStackView(arrangedSubviews: textFieldsArray.map ({ item in
            let textfield = item.1
            textfield.layer.borderColor = UIColor.red.cgColor
            textfield.layer.borderWidth = 2
            textfield.layer.cornerRadius = 10
            textfield.isUserInteractionEnabled = true
            textfield.autocapitalizationType = .sentences
            let attributes: [NSAttributedString.Key : Any]? = [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.gray
            ]
            
            textfield.attributedPlaceholder = NSAttributedString(string: item.0, attributes: attributes)
            textfield.borderStyle = .roundedRect
            
            textfield.snp.makeConstraints {
                $0.height.equalTo(50)
            }
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDate))
            let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDate))
            toolbar.setItems([doneBtn, space, cancelBtn], animated: true)
            eventDateTF.inputAccessoryView = toolbar
            eventDateTF.inputView = date
            
            return textfield
        }))
        
        eventStackView.axis = .vertical
        eventStackView.spacing = 10
        
        mainSV.addArrangedSubview(eventStackView)
        
        eventStackView.snp.makeConstraints {
            $0.trailing.leading.equalTo(mainSV)
        }
        
        let addEventBtn = UIButton()
        addEventBtn.setTitle("Add Event", for: .normal)
        addEventBtn.setTitleColor(.white, for: .normal)
        addEventBtn.backgroundColor = .red
        addEventBtn.layer.cornerRadius = 10
        addEventBtn.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        mainSV.addArrangedSubview(addEventBtn)
        
        addEventBtn.snp.makeConstraints {
            $0.left.right.equalTo(mainSV).inset(16)
        }
    }
    
    @objc private func doneDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        eventDateTF.text = formatter.string(from: date.date)
        view.endEditing(true)
    }
    
    @objc private func cancelDate() {
        view.endEditing(true)
    }
    
    @objc private func addEvent() {

        createEvent()
        let fetchRequest: NSFetchRequest<EventCoreData> = EventCoreData.fetchRequest()
        do {
            let events = try context.fetch(fetchRequest)
            for event in events {
                print("Event Name: \(event.eventName ?? "Unknown Name")")
                print("Event Description: \(event.eventDescription ?? "No Description")")
                print("1st team: \(event.firtsTeam ?? "No Description")")
                print("2nd team: \(event.secondTeam ?? "No Description")")
                print("Date \(event.date ?? "No Description")")
                print("--------------------------------")
            }
        } catch {
            print("Ошибка при загрузке данных: \(error)")
        }
        print(try! context.count(for: fetchRequest))
        dismiss(animated: true)
    }
    
    @objc private func getImageFromDevice(_ sender: UIButton!) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                if status == .authorized {
                    self.showImagePicker()
                } else {
                    print("No access")
                }
            }
        }
    }
    
    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let asset = info[.phAsset] as? PHAsset else { return }
        let requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        requestOption.deliveryMode = .fastFormat

        let data = PHImageManager.default().requestImageData(for: asset, options: requestOption, resultHandler: { data, _, _, _ in
            if let data = data {
                guard let image = UIImage(data: data) else { return }
                self.eventImage.image = image
            }
        })
        dismiss(animated: true)
    }
}



