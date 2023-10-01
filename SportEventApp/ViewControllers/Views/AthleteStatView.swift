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
    
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    
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
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.white
        
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.textAlignment = .right
        subtitleLabel.textColor = UIColor.white
  
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  
        // MARK: Adding views
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(blurEffectView)
        self.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
    }
    
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
