//
//  AthleteStatView.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 19.09.2023.
//

import Foundation
import UIKit
import SnapKit

class AthleteStatView: UIView {
    
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AthleteStatView {
    
    func setupView() {
        
        backgroundColor = UIColor.clear
        layer.cornerRadius = 12
        layer.cornerCurve = .continuous
        clipsToBounds = true
        
        // MARK: Configure views
        
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            label.textColor = UIColor.white
            
            return label
        }()
        
        subtitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .right
            label.textColor = UIColor.white
            
            return label
        }()
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView: UIVisualEffectView = {
            let blur = UIVisualEffectView(effect: blurEffect)
            blur.frame = self.bounds
            blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            return blur
        }()
        
        // MARK: Adding views
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(blurEffectView)
        self.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
    }
    
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
