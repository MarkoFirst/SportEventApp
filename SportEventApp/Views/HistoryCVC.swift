//
//  HistoryCVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.09.2023.
//

import Foundation
import UIKit
import SnapKit

class HistoryCVC: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryCVC {
    
    func setupViews() {
        
        let view = UIView()
        view.backgroundColor = .clear
        contentView.addSubview(view)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        view.addSubview(separatorView)
        
        let yearView = UIView()
        yearView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 1)
        yearView.layer.cornerRadius = 12
        yearView.layer.borderWidth = 2
        yearView.layer.borderColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1).cgColor
        view.addSubview(yearView)

        let yearLabel = UILabel()
        yearLabel.text = "2016"
        yearLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        yearLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        yearLabel.textAlignment = .center
        yearLabel.adjustsFontSizeToFitWidth = true
        yearView.addSubview(yearLabel)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        for _ in 0...3 {
            let sView = UIView()
            sView.backgroundColor = .clear
            stackView.addArrangedSubview(sView)
            
            let lineImage = UIImageView()
            lineImage.image = UIImage(named: "lineGradient")
            sView.addSubview(lineImage)
            
            lineImage.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(8)
                $0.bottom.equalToSuperview()
                $0.width.equalTo(0.3)
                $0.height.equalTo(sView.snp.height).multipliedBy(0.7)
            }
        }
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.centerY.equalTo(yearView.snp.centerY)
            $0.leading.trailing.equalToSuperview()
        }
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        yearView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(4)
            $0.height.equalTo(view.snp.height).multipliedBy(0.15)
            $0.width.equalTo(yearView.snp.height).multipliedBy(2.5)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.centerY.equalTo(yearView.snp.centerY)
            $0.leading.trailing.equalToSuperview()
        }
        
        yearLabel.snp.makeConstraints { $0.edges.equalToSuperview().inset(4) }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(yearView.snp.bottom).inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

