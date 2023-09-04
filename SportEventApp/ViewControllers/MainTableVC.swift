//
//  MainTableVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 03.09.2023.
//

import Foundation
import UIKit

class MainTableVC: UIViewController {
let liveScoreId = "liveScoreId"
    let sportsTVCId = "sportsTVC"
    let eventTVCId = "eventTVCId"
    
    @IBOutlet weak var tableViev: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViev.delegate = self
        tableViev.dataSource = self
        tableViev.register(UINib(nibName: "LiveScoreTVC", bundle: nil), forCellReuseIdentifier: liveScoreId)
        tableViev.register(UINib(nibName: "LiveScoreTVC", bundle: nil), forCellReuseIdentifier: sportsTVCId)
        tableViev.register(UINib(nibName: "EventTVC", bundle: nil), forCellReuseIdentifier: eventTVCId)
        
    }
    
}

extension MainTableVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let liveScoreCell = tableView.dequeueReusableCell(withIdentifier: liveScoreId, for: indexPath)
        let sportsTVCCell = tableView.dequeueReusableCell(withIdentifier: sportsTVCId, for: indexPath)
        let eventTVCCell = tableView.dequeueReusableCell(withIdentifier: eventTVCId, for: indexPath)
        switch indexPath.section {
        case 0:
            return liveScoreCell
        case 1:
            return sportsTVCCell
        case 2:
            return eventTVCCell
        default:
            return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 2:
//            return "Events"
//        default:
//            return nil
//        }
//    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

}
