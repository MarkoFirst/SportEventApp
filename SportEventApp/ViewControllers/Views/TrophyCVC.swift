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
    
    lazy var trophyView = UIView()
    lazy var trophyNameLabel = UILabel()
    lazy var trophyQtyBadgeView = UIView()
    lazy var trophyQtyLabel = UILabel()
    lazy var trophyImage = UIImageView()
    
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
        
        trophyView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            view.layer.cornerRadius = 12
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
            view.clipsToBounds = true
            
            return view
        }()
        
        trophyNameLabel = {
            let label = UILabel()
            label.text = "Europen super cup"
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.textColor = UIColor.white
            label.textAlignment = .left
            label.numberOfLines = 2
            label.lineBreakMode = .byTruncatingTail
            label.adjustsFontSizeToFitWidth = true
            
            return label
        }()
        
        trophyQtyBadgeView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
            view.layer.cornerRadius = 12
            
            return view
        }()
        
        trophyQtyLabel = {
            let label = UILabel()
            label.text = "8"
            label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            
            return label
        }()
    
        trophyImage = {
            let image = UIImageView()
            image.image = UIImage(named: "lavine")
            image.contentMode = .scaleAspectFit
            image.clipsToBounds = true
            
            return image
        }()
        
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
