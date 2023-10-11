//
//  DiscsplineView.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

class DisciplineView: UIView {
    
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DisciplineView {
    
    func setupView() {
        
        backgroundColor = UIColor.clear
        
        // MARK: Configure views
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.white
        
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = UIColor.white
        
        imageView = UIImageView()
        
        // MARK: Adding views
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(imageView)
        
        // MARK: Setup constraints
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalTo(titleLabel.snp.trailing).offset(4)
            make.size.equalTo(20)
        }
    }
    
    func configure(title: String, subtitle: String, imageView: UIImageView) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = imageView.image
    }
}

