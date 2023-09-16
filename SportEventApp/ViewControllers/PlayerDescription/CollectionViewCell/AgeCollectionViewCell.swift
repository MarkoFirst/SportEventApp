//
//  AchivementsCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 15.09.2023.
//

import UIKit

class AgeCollectionViewCell: UICollectionViewCell {
    let nameOfAchiveLabel = UILabel()
    let achiveLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameOfAchiveLabel.text = "AGE"
        nameOfAchiveLabel.textColor = .gray
        nameOfAchiveLabel.font = .systemFont(ofSize: 20, weight: .black)
        
        achiveLabel.text = "33"
        achiveLabel.textColor = .white
        achiveLabel.font = .systemFont(ofSize: 20, weight: .black)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .gray.withAlphaComponent(0.2)
        contentView.addSubview(nameOfAchiveLabel)
        contentView.addSubview(achiveLabel)
        
        nameOfAchiveLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(4)
            $0.left.equalTo(contentView.snp.left).inset(4)
        }
        
        achiveLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).inset(4)
            $0.right.equalTo(contentView.snp.right).inset(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
