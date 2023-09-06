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
            return 15
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellId", for: indexPath as IndexPath) as! EventTypeCVC
            
            
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    }

    



