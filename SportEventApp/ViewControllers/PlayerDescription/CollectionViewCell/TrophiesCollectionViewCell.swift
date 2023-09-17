//
//  TrophiesCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class TrophiesCollectionViewCell: UICollectionViewCell {
    let trophieName = UILabel()
    let bgView = UIView()
    var trophieNumber = Int()
    let trophieQuantity = UILabel()
    var trophieImage = UIImageView()

    override init(frame: CGRect) {
        trophieNumber = 3
        trophieQuantity.text = String(trophieNumber)
        super.init(frame: frame)
        contentView.backgroundColor = .gray.withAlphaComponent(0.2)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16
        
        trophieName.text = "European\ncup"
        trophieName.textColor = .white
        trophieName.numberOfLines = 2
        trophieName.font = .systemFont(ofSize: 16, weight: .black)
        contentView.addSubview(trophieName)
        
        trophieName.snp.makeConstraints {
            $0.left.top.equalTo(contentView).inset(8)
        }
        
        bgView.backgroundColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        let bgViewSize: CGFloat = 36
        bgView.heightAnchor.constraint(equalToConstant: bgViewSize).isActive = true
        bgView.widthAnchor.constraint(equalToConstant: bgViewSize).isActive = true
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = bgViewSize / 2
        contentView.addSubview(bgView)
        
        bgView.snp.makeConstraints {
            $0.left.bottom.equalTo(contentView).inset(8)
        }
        trophieQuantity.text = String(trophieNumber)
        trophieQuantity.textColor = .white
        trophieQuantity.numberOfLines = 1
        trophieQuantity.font = .systemFont(ofSize: 20, weight: .black)
        contentView.addSubview(trophieQuantity)
        
        trophieQuantity.snp.makeConstraints {
            $0.center.equalTo(bgView.snp.center)
        }
        
        trophieImage.image = UIImage(named: "cup1")
        contentView.addSubview(trophieImage)
        
        trophieImage.snp.makeConstraints {
            $0.top.equalTo(trophieName.snp.bottom).inset(-4)
            $0.bottom.equalTo(contentView).inset(8)
            $0.left.equalTo(trophieQuantity.snp.right).inset(-24)
            $0.right.equalTo(contentView).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
