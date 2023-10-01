//
//  GoalView.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

class GoalView: UIView {
    
    private var baseView: UIView!
    private var externalCircleView: UIView!
    private var centerCircleView: UIView!
    var countLabel: UILabel!
    var goalLabel: UILabel!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalView {
    
    func setupView() {
        
        backgroundColor = UIColor.clear
        
        // MARK: Configure views
        
        baseView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.58)
            view.layer.cornerRadius = 32
            
            return view
        }()
        
        externalCircleView = {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            view.layer.cornerRadius = 32
            view.layer.borderWidth = 8
            view.layer.borderColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1).cgColor
            
            return view
        }()
        
        centerCircleView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.backgroundColor = UIColor(red: 0.275, green: 0.502, blue: 0.314, alpha: 1)
            
            return view
        }()
        
        countLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            label.textColor = UIColor.white
            
            return label
        }()
        
        goalLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            label.textColor = UIColor.white
            
            return label
        }()
        
        // MARK: Adding views
        
        self.addSubview(baseView)
        baseView.addSubview(externalCircleView)
        baseView.addSubview(centerCircleView)
        centerCircleView.addSubview(countLabel)
        self.addSubview(goalLabel)

        
        // MARK: Setup constraints
        
        baseView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.height.equalTo(64)
        }
        
        externalCircleView.snp.makeConstraints { make in
            make.center.equalTo(baseView)
            make.width.height.equalTo(64)
        }
        
        centerCircleView.snp.makeConstraints { make in
            make.center.equalTo(baseView)
            make.width.height.equalTo(24)
        }
        
        countLabel.snp.makeConstraints { make in
            make.center.equalTo(centerCircleView)

        }
        
        goalLabel.snp.makeConstraints { make in
            make.centerX.equalTo(baseView.snp.centerX)
            make.top.equalTo(baseView.snp.bottom).offset(4)
            make.width.equalTo(baseView.snp.width)
            make.bottom.equalToSuperview()
        }
    }
    
//    func configure() {

//    }
}
