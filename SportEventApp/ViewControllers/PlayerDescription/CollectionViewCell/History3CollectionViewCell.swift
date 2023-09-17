//
//  History3CollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class History3CollectionViewCell: HistoryCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn1.setTitle("2018", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
