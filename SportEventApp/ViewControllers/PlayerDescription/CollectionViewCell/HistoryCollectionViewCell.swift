//
//  HistoryCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    var btn1 = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn1.setTitle("2016", for: .normal)
        btn1.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        btn1.backgroundColor = .gray.withAlphaComponent(0.2)
        btn1.layer.cornerRadius = 8
        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.isUserInteractionEnabled = true
        contentView.addSubview(btn1)
        
        btn1.snp.makeConstraints {
            $0.top.left.equalTo(contentView)
            $0.width.equalTo(50)
            $0.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
