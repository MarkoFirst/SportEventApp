//
//  TableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 06.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sportTypeCV: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        //cell settings
        sportTypeCV.register(UINib(nibName: "FootballCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "footballCell")
        sportTypeCV.register(UINib(nibName: "BasketballCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "basketballCell")
        sportTypeCV.register(UINib(nibName: "RugbyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "rugbyCell")
        sportTypeCV.register(UINib(nibName: "TenisCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tennisCell")
        sportTypeCV.register(UINib(nibName: "PingPongCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pingpongCell")
        sportTypeCV.register(UINib(nibName: "PokerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pokerCell")
        sportTypeCV.register(UINib(nibName: "ChessCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "chessCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // collectionview settings
        sportTypeCV.dataSource  = self
        sportTypeCV.delegate = self
        if let layout = sportTypeCV.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 14
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedCell = sportTypeCV.cellForItem(at: indexPath)!
            selectedCell.contentView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = sportTypeCV.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = #colorLiteral(red: 0.4172288477, green: 0.5609018803, blue: 0.6608301401, alpha: 1)
    }
}


extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        var cell = UICollectionViewCell()
        switch indexPath.item {
        case 0:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "footballCell", for: indexPath)
        case 1:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "basketballCell", for: indexPath)
        case 2:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "rugbyCell", for: indexPath)
        case 3:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "tennisCell", for: indexPath)
        case 4:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "pingpongCell", for: indexPath)
        case 5:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "pokerCell", for: indexPath)
        case 6:
            cell = sportTypeCV.dequeueReusableCell(withReuseIdentifier: "chessCell", for: indexPath)
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 138)
    }
}

