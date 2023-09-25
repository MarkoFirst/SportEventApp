//
//  Trophies4CollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 25.09.2023.
//

import UIKit

class Trophies4CollectionViewCell: TrophiesCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        trophieName.text = "FIFA Cup of\nChampions"
        trophieNumber = 1
        trophieQuantity.text = String(trophieNumber)
        trophieImage.image = UIImage(named: "cup4")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
