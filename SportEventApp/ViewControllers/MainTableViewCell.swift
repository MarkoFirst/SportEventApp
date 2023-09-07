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
        // Initialization code
        insideEventCell.register(UINib(nibName: "MainTableviewTableViewCell", bundle: nil), forCellReuseIdentifier: "sportEvent")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        insideEventCell.dataSource = self
        insideEventCell.delegate = self
        // Configure the view for the selected state
    }

}

extension MainTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch indexPath.item {
        case 0:
            let cell = insideEventCell.dequeueReusableCell(withIdentifier: "sportEvent", for: indexPath)
            return cell
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
}
