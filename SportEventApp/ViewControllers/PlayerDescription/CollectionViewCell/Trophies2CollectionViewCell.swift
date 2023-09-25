//
//  Trophies2CollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 25.09.2023.
//

import UIKit

class Trophies2CollectionViewCell: TrophiesCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        trophieName.text = "FIFA Club\nWorld Cup"
        trophieNumber = 3
        trophieQuantity.text = String(trophieNumber)
        trophieImage.image = UIImage(named: "cup2")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
