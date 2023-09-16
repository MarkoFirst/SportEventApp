//
//  GamesCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 15.09.2023.
//

import UIKit

class GamesCollectionViewCell: AgeCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameOfAchiveLabel.text = "GAMES"
        achiveLabel.text = "14"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
