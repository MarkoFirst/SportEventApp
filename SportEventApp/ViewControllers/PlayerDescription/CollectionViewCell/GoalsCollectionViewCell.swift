//
//  GoalsCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 15.09.2023.
//

import UIKit

class GoalsCollectionViewCell: AgeCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameOfAchiveLabel.text = "GOALS"
        achiveLabel.text = "10"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
