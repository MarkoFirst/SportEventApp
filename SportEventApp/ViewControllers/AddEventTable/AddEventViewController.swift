//
//  AddEventTableViewController.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 05.10.2023.
//

import UIKit
import SnapKit
import Photos


class AddEventViewController: UIViewController{
    var delegate = [EventCoreData]() {
        didSet {
            mainEventTableView.reloadData()
        }
    }
    let mainEventTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    let createEventCD = CreateEventByCoreDataViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        createEventCD.delegateVC = self
        createEventCD.getAllEvents()
        mainEventTableView.dataSource = self
        mainEventTableView.delegate = self
    }
}
     
extension AddEventViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(delegate.count)
        return delegate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainEventTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? AddEventsTableViewCell
        let data = delegate[indexPath.row]
        cell?.configureByCD(with: data)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { action, indexPath in
            
            let itemToDelete = self.delegate[indexPath.row]
            do {
                self.createEventCD.deleteEvent(item: itemToDelete)
            }
            self.delegate.remove(at: indexPath.row)
        }
        return [deleteAction]
    }
}

extension AddEventViewController {
    private func setupLayout() {
        view.backgroundColor = UIColor(red: 0, green: 0.14, blue: 0.25, alpha: 1)
        
        mainEventTableView.backgroundColor = UIColor(red: 0, green: 0.14, blue: 0.25, alpha: 1)
        mainEventTableView.register(AddEventsTableViewCell.self, forCellReuseIdentifier: "eventCell")
        view.addSubview(mainEventTableView)
                
        let editBtn = UIButton(type: .system)
        editBtn.addTarget(self, action: #selector(presentAddVC), for: .touchUpInside)
        editBtn.setTitle("Add", for: .normal)
        editBtn.tintColor = .white
        view.addSubview(editBtn)
        
        editBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
        }
        
        mainEventTableView.snp.makeConstraints {
            $0.top.equalTo(editBtn.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func presentAddVC() {
        let vc = CreateEventByCoreDataViewController()
        vc.delegateVC = self
        present(vc, animated: true)
    }
}
