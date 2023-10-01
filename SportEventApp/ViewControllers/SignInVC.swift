//
//  SignInVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 05.09.2023.
//

import Foundation
import UIKit

class SignInVC: UIViewController {
    
  
    
    @IBOutlet weak var signInTVC: UITableView!
    
    //@IBOutlet weak var scoreOfTeams: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInTVC.delegate = self
        signInTVC.dataSource = self
        
    }
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        print("btn pressed")
    }
    @IBAction func pushToProfile(_ sender: UIButton) {
        navigationController?.pushViewController(PlayerStatVC(), animated: true)
    }
    
}





extension SignInVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 250.0
        case 1: return 138.0
        case 2: return 300.0
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.section {
        case 0:
            let cell = signInTVC.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
            cell.layer.cornerRadius = 60
            return cell
            
        case 1:
            let cell = signInTVC.dequeueReusableCell(withIdentifier: "SportTypeCell", for: indexPath)
            return cell
        case 2:
            let cell = signInTVC.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
            
            return cell
        default: break
        }
        return UITableViewCell()
    }
}




