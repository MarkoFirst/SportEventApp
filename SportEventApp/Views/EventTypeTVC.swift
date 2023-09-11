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
    
    var filter: [TypeOfSport] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var eventType: [TypeOfSport] = [.football, .basketball, .volleyball, .tennis, .pingpong, .chess, .poker, .fencing, .cybersport]
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
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.allowsMultipleSelection = true
        self.collectionView.register(UINib.init(nibName: "EventTypeCVC", bundle: nil), forCellWithReuseIdentifier: "eventCellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellId", for: indexPath as IndexPath) as! EventTypeCVC
        cell.typeEventIcon.image = eventTypeIcon[indexPath.row]
        cell.labelCVC.text = eventType[indexPath.row].rawValue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filter.append(eventType[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectType = eventType[indexPath.row]
        filter.removeAll(where: ({$0 == deselectType}))
    }
}
    



