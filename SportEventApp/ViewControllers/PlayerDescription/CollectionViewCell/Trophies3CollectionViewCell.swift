//
//  Trophies3CollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 25.09.2023.
//

import UIKit

class Trophies3CollectionViewCell: TrophiesCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        trophieName.text = "European\nsuper cup"
        trophieNumber = 2
        trophieQuantity.text = String(trophieNumber)
        trophieImage.image = UIImage(named: "cup3")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
