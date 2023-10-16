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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.allowsMultipleSelection = true
        self.collectionView.register(UINib.init(nibName: "EventTypeCVC", bundle: nil), forCellWithReuseIdentifier: "eventCellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TypeOfSport.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellId", for: indexPath as IndexPath) as! EventTypeCVC
        cell.typeEventIcon.image = UIImage(named: TypeOfSport.allImages[indexPath.row]) ?? UIImage()
        cell.labelCVC.text = TypeOfSport.allCases[indexPath.row].rawValue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filter.append(TypeOfSport.allCases[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectType = TypeOfSport.allCases[indexPath.row]
        filter.removeAll(where: ({$0 == deselectType}))
    }
}
