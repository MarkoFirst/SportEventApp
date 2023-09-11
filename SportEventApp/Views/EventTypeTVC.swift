//
//  EventTypeTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 06.09.2023.
//

import Foundation
import UIKit

@IBDesignable

class EventTypeTVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var eventType: [String] = ["Football", "Basketball", "Volleyball", "Tennis", "Ping-pong", "Chess", "Poker", "Fencing", "Cybersport"]
    var eventTypeIcon: [UIImage] = [
        UIImage(named: "footballIcon")!,
        UIImage(named: "basketballIcon")!,
        UIImage(named: "volleyballIcon")!,
        UIImage(named: "tennisIcon")!,
        UIImage(named: "pingpongIcon")!,
        UIImage(named: "chessIcon")!,
        UIImage(named: "pokerIcon")!,
        UIImage(named: "fencingIcon")!,
        UIImage(named: "cybesportIcon")!
        ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "EventTypeCVC", bundle: nil), forCellWithReuseIdentifier: "eventCellId")
        
    }
    
    //        override func setSelected(_ selected: Bool, animated: Bool) {
    //            super.setSelected(selected, animated: animated)
    //
    //        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventType.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellId", for: indexPath as IndexPath) as! EventTypeCVC
        cell.typeEventIcon.image = eventTypeIcon[indexPath.row]
        cell.labelCVC.text = eventType[indexPath.row]
        
        return cell
    }
}
    



