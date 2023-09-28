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
        
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            label.textColor = UIColor.white
            
            return label
        }()
        
        subtitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.numberOfLines = 2
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            label.textColor = UIColor.white
            
            return label
        }()
        
        imageView = {
            let imageView = UIImageView()
     
            return imageView
        }()
        
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
            make.width.height.equalTo(20)
            
        }
    }
    
    func configure(title: String, subtitle: String, imageView: UIImageView) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = imageView.image
    }
}

