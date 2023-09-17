//
//  History2CollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class History2CollectionViewCell: HistoryCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn1.setTitle("2017", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
