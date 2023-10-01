//
//  TrophiesCVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 22.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TrophyCVC: UICollectionViewCell {
    
    var trophyNameLabel: UILabel!
    var trophyQtyLabel: UILabel!
    var trophyImage: UIImageView!
    
    static let trophyCellId = "TrophyCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrophyCVC {
    
    func setupView() {
        
        // MARK: Configure views
        
            let trophyView = UIView()
            trophyView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            trophyView.layer.cornerRadius = 12
            trophyView.layer.borderWidth = 0.5
            trophyView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
            trophyView.clipsToBounds = true

            trophyNameLabel = UILabel()
            trophyNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            trophyNameLabel.textColor = UIColor.white
            trophyNameLabel.textAlignment = .left
            trophyNameLabel.numberOfLines = 2
            trophyNameLabel.lineBreakMode = .byTruncatingTail
            trophyNameLabel.adjustsFontSizeToFitWidth = true
  
            let trophyQtyBadgeView = UIView()
            trophyQtyBadgeView.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
            trophyQtyBadgeView.layer.cornerRadius = 12

            trophyQtyLabel = UILabel()
            trophyQtyLabel.text = "8"
            trophyQtyLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            trophyQtyLabel.textColor = UIColor.white
            trophyQtyLabel.textAlignment = .center
            trophyQtyLabel.numberOfLines = 1
            trophyQtyLabel.adjustsFontSizeToFitWidth = true

            trophyImage = UIImageView()
            trophyImage.image = UIImage(named: "lavine")
            trophyImage.contentMode = .scaleAspectFit
            trophyImage.clipsToBounds = true
        
        // MARK: Adding views
        
        contentView.addSubview(trophyView)
        trophyView.addSubview(trophyNameLabel)
        trophyView.addSubview(trophyQtyBadgeView)
        trophyView.addSubview(trophyImage)
        trophyQtyBadgeView.addSubview(trophyQtyLabel)
        
        // MARK: Setup constraints
        
        trophyView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)        }
        
        trophyNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(trophyView).inset(12)
            make.top.equalTo(trophyView.snp.top).offset(12)
            make.height.equalTo(36)
        }
        
        trophyQtyBadgeView.snp.makeConstraints { make in
            make.leading.equalTo(trophyView.snp.leading).offset(12)
            make.bottom.equalTo(trophyView.snp.bottom).offset(-12)
            make.width.height.equalTo(24)
        }
        
        trophyQtyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(trophyQtyBadgeView.snp.centerX)
            make.centerY.equalTo(trophyQtyBadgeView.snp.centerY)
        }
        
        trophyImage.snp.makeConstraints { make in
            make.top.equalTo(trophyNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(trophyQtyBadgeView.snp.trailing).offset(8)
            make.trailing.equalTo(trophyView.snp.trailing).offset(-12)
            make.bottom.equalTo(trophyView.snp.bottom).offset(-12)
        }
    }
    
    func configure(with trophyData: (UInt, String, UIImage?)) {
        trophyQtyLabel.text = trophyData.0.description
        trophyNameLabel.text = trophyData.1
        trophyImage.image = trophyData.2
    }
}
