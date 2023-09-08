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
        insideEventCell.register(UINib(nibName: "SecondaryTableViewCell", bundle: nil), forCellReuseIdentifier: "secondaryEvent")
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        //let selectedRow = insideEventCell.cellForRow(at: indexPath)
//        switch indexPath.item {
//        case 0:
//            if let destinationViewController = self.inputViewController?.storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionViewController {
//                self.inputViewController?.navigationController?.pushViewController(destinationViewController, animated: true)}
//        default: break
//        }
//    }
}
