
//  TrophiesCollectionViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.


import UIKit

import UIKit
import SnapKit

class TrophiesCollectionViewCell: UICollectionViewCell {
    
    var dataArray: (String, Int, UIImage)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setup() {
        contentView.backgroundColor = .gray.withAlphaComponent(0.2)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16

        let bgView = UIView()
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

        let cellView = UIView()
        contentView.addSubview(cellView)

        if let dataArray = dataArray {
            let trophieName = UILabel()
            trophieName.text = dataArray.0
            trophieName.textColor = .white
            trophieName.numberOfLines = 2
            trophieName.font = .systemFont(ofSize: 16, weight: .black)
            cellView.addSubview(trophieName)

            trophieName.snp.makeConstraints {
                $0.left.top.equalTo(cellView).inset(8)
                $0.height.equalTo(50)
            }

            let trophieQuantity = UILabel()
            trophieQuantity.text = dataArray.1.description
            trophieQuantity.textColor = .white
            trophieQuantity.numberOfLines = 1
            trophieQuantity.font = .systemFont(ofSize: 20, weight: .black)
            cellView.addSubview(trophieQuantity)

            trophieQuantity.snp.makeConstraints {
                $0.center.equalTo(bgView.snp.center)
            }

            let trophieImage = UIImageView()
            trophieImage.image = dataArray.2
            cellView.addSubview(trophieImage)

            trophieImage.snp.makeConstraints {
                $0.top.equalTo(trophieName.snp.bottom)
                $0.bottom.equalTo(cellView).inset(8)
                $0.left.equalTo(trophieQuantity.snp.right).inset(-24)
                $0.right.equalTo(cellView).inset(8)
            }
        }

        cellView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
