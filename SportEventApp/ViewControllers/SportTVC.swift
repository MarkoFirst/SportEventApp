//
//  SportCV.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 05.09.2023.
//

import Foundation
import UIKit

class SportTVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let sportCCellId = "sportCCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var sports: [Sport] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib.init(nibName: "SportCVC", bundle: nil), forCellWithReuseIdentifier: sportCCellId)
        
        // Adding Sport instances
        sports.append(basketball)
        sports.append(football)
        sports.append(tennis)
        sports.append(chess)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sportCCell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCCellId, for: indexPath as IndexPath) as! SportCVC
        
        // Отримуємо спорт за індексом indexPath.item з масиву sports
        let sport = sports[indexPath.item]
        
        // Встановлюємо зображення спорту для sportImage
        if let sportImageName = sport.sportImage {
            sportCCell.sportImage?.image = UIImage(named: sportImageName) ?? UIImage(named: "unknown")
        } 
        
        // Встановлюємо зображення спорту для sportImage
        sportCCell.sportLabel.text = sport.name ?? "Unknown sport"
        
        
        return sportCCell
    }
}
