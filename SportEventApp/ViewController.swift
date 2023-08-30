//
//  ViewController.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellId = "cell"
    private let customId = "addedCell"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    private var nameList = ["Kate", "Vadim", "Dima", "Ernest", "Max"]
    private var addedList: [String] = []
    
    private var style: UITableViewCell.EditingStyle = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.register(UINib(nibName: "AddedNameTVC", bundle: nil), forCellReuseIdentifier: customId)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func tapToEdit(_ sender: UIButton) {
        style = .delete
        tableView.isEditing.toggle()
        addBtn.isEnabled.toggle()
        sender.setTitle(
            tableView.isEditing ? "Cancel" : "Edit",
            for: .normal
        )
    }
    
    @IBAction func tapToAdd(_ sender: UIButton) {
        style = .insert
        editBtn.isEnabled.toggle()
        tableView.isEditing.toggle()
        sender.setTitle(
            tableView.isEditing ? "Cancel" : "Add",
            for: .normal
        )
    }
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
        
        cell.titleLabel.text = indexPath.section == 0 ? nameList[indexPath.row] : addedList[indexPath.row]
        cell.myImage.image = UIImage(named: "Cover Image")
        
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
}
