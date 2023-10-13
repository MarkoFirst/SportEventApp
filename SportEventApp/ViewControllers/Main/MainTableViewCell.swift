//
//  MainTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 07.09.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var insideEventCell: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        insideEventCell.register(UINib(nibName: "MainTableviewTableViewCell", bundle: nil), forCellReuseIdentifier: "sportEvent")
        insideEventCell.register(UINib(nibName: "SecondaryTableViewCell", bundle: nil), forCellReuseIdentifier: "secondaryEvent")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        insideEventCell.dataSource = self
        insideEventCell.delegate = self
    }

}

extension MainTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.item {
        case 0:
            cell = insideEventCell.dequeueReusableCell(withIdentifier: "sportEvent", for: indexPath)
        case 1:
            cell = insideEventCell.dequeueReusableCell(withIdentifier: "secondaryEvent", for: indexPath)
            
            return cell
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.item {
        case 0:
            return 135.0
        case 1:
            return 100.0
        default: return 0
        }
    }
}
