//
//  TrophiesCVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 26.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TrophiesCVC: UICollectionViewCell {
    
    let label = UILabel()
    let image = UIImageView()
    let cupValue = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrophiesCVC {
    
    private func setupViews() {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1).cgColor
        contentView.addSubview(view)
        
        label.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        view.addSubview(image)
        
        let cirle = UIImageView()
        cirle.image = UIImage(named: "circle")
        view.addSubview(cirle)
        
        cupValue.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        cupValue.adjustsFontSizeToFitWidth = true
        cupValue.textAlignment = .center
        cupValue.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(cupValue)
        
        view.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        label.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
        
        image.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
            $0.width.equalTo(image.snp.height).multipliedBy(0.5)
        }
        
        cirle.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(image.snp.leading)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(cirle.snp.width).multipliedBy(1)
        }
        
        cupValue.snp.makeConstraints {
            $0.centerY.equalTo(cirle.snp.centerY)
            $0.centerX.equalTo(cirle.snp.centerX)
            $0.size.equalTo(cirle.snp.size).multipliedBy(0.3)
        }
    }
}
