//
//  ViewController.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let cellId = "cell"
    private let customId = "addedCell"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    private var nameList = ["Kate", "Vadim", "Dima", "Ernest", "Max"]
    private var addedList: [String] = []
    
    private var style: UITableViewCell.EditingStyle = .none
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
//    private var spinner: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.register(UINib(nibName: "AddedNameTVC", bundle: nil), forCellReuseIdentifier: customId)
        
        tableView.delegate = self
        tableView.dataSource = self
    
        refreshControl.addTarget(self, action: #selector(poolToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        refreshControl.tintColor = .systemPink
        refreshControl.attributedTitle = NSMutableAttributedString(string: "some")
        
//        let btn = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
//        btn.backgroundColor = .gray
//        spinner = UIActivityIndicatorView(style: .medium)
//        spinner?.color = .green
//        btn.addSubview(spinner!)
//
//        view.addSubview(btn)
        
        
        tableView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(44)
        }
    }
    
    @objc
    private func poolToRefresh() {
        print(#function)
        refreshControl.endRefreshing()
    }

//    @IBAction func tapToEdit(_ sender: UIButton) {
//        style = .delete
//        tableView.isEditing.toggle()
//        addBtn.isEnabled.toggle()
//        sender.setTitle(
//            tableView.isEditing ? "Cancel" : "Edit",
//            for: .normal
//        )
//    }
    
//    @IBAction func tapToAdd(_ sender: UIButton) {
//        style = .insert
//        editBtn.isEnabled.toggle()
//        tableView.isEditing.toggle()
//        sender.setTitle(
//            tableView.isEditing ? "Cancel" : "Add",
//            for: .normal
//        )
//    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return nameList.count
        case 1:
            return addedList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customId, for: indexPath) as? AddedNameTVC else {
            return UITableViewCell()
        }
        
        let element = indexPath.section == 0 ? nameList[indexPath.row] : addedList[indexPath.row]
        
        cell.titleLabel.text = element
//        cell.myImage.image = UIImage(named: "Cover Image")
//        
//        let event = Event()
//        cell.myImage.image = event.image
        
//        if indexPath.row == addedList.count - 1 {
//            spinner?.startAnimating()
//
//            spinner?.stopAnimating()
//        }
        
//        [36,24,37].forEach {
//            let view = UIView()
//
//            label.text = $0
//            view.addSubview(label)
//
//            cell.testStack.addArrangedSubview(view)
//        }
//
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return style
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            if indexPath.section == 0 {
                nameList.remove(at: indexPath.row)
            } else {
                addedList.remove(at: indexPath.row)
            }
            
            let animation: UITableView.RowAnimation
            
            switch indexPath.row {
            case 0:
                animation = .bottom
            case 1:
                animation = .fade
            case 2:
                animation = .left
            case 3:
                animation = .middle
            case 4:
                animation = .right
            default:
                animation = .automatic
            }
            
            tableView.deleteRows(at: [indexPath], with: animation)
        case .insert:
            addedList.append("new element from \(nameList[indexPath.row])")
            tableView.reloadData()
        case .none:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Names"
        case 1:
            return "Did add"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let event = eventList[indexPath.row] // as Event
//        navigationController?.pushViewController(EventVC(event), animated: true)
    }

    func createEvent(teams: [Team], date: Date, title: String, place: Place, description: String) -> Event {
        guard let commonSport = teams.first?.sport.type,
              teams.allSatisfy({ $0.sport.type == commonSport }),
              let equipment = teams.first?.sport.equipment,
              teams.allSatisfy({ $0.sport.equipment == equipment })
        else {
            fatalError("Невірні дані для створення події.")
        }
        
        let event = SportEvent(
            title: title,
            description: description,
            date: date,
            location: place,
            tickets: place.tickets,
            sport: Sport(type: commonSport, equipment: equipment),
            teams: teams
        )
        
        return event
    }
}



//{
//   "name": "Vadim"
//   "surname": "Babiichuck"
//   "age": 27
//    "avatar"
//}
//
//{
//   "name": "Kate"
//   "surname": "Somnikova"
//   "age": 23,
//   "childs": [
//
//   ]
//}
//
//class User {
//    var name: String
//    var surname: String
//    var age: UInt
//
//    var child: ([User])?
//}
