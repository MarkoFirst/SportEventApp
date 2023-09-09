//
//  SportCV.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 05.09.2023.
//

import Foundation
import UIKit

class SportTVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sportCCellId = "sportCCell"
    private var sports: [Sport] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib.init(nibName: "SportCVC", bundle: nil), forCellWithReuseIdentifier: sportCCellId)
        
        // Adding Sport instances
        sports.append(basketball)
        sports.append(football)
        sports.append(tennis)
        sports.append(soccer)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sportCCell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCCellId, for: indexPath as IndexPath) as! SportCVC
        
        // Get sport by index.path from array
        let sport = sports[indexPath.item]
        
        // Set sport image
        if let sportImageName = sport.sportImage {
            sportCCell.sportImage?.image = UIImage(named: sportImageName) ?? UIImage(named: "unknown")
        }
        
        // Set sport label
        sportCCell.sportLabel.text = sport.name ?? "Unknown sport"
        
        return sportCCell
    }
}
