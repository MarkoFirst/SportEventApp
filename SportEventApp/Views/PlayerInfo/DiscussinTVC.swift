//
//  DiscussinTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 23.09.2023.
//

import Foundation
import UIKit
import SnapKit

class DiscussinTVC: UITableViewCell {
    
    private let disscussUsers = ["discussUser1", "discussUser2", "discussUser3", "discussUser4", "discussUser5"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DiscussinTVC {
    
    private func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let discussinView = UIView()
        discussinView.backgroundColor = .clear
        contentView.addSubview(discussinView)
        
        let discussingNowBtn = UIButton(type: .system)
        discussingNowBtn.setTitle("Now discussing", for: .normal)
        discussingNowBtn.setImage(UIImage(named: "discussLogo"), for: .normal)
        discussingNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        discussingNowBtn.tintColor = UIColor(red: 0.106, green: 0.553, blue: 0.992, alpha: 1)
        contentView.addSubview(discussingNowBtn)
        
        let discussUsersStackView = UIStackView()
        discussUsersStackView.axis = .horizontal
        discussUsersStackView.spacing = -17
        contentView.addSubview(discussUsersStackView)
        
        disscussUsers.forEach {
            
            let image = UIImageView()
            image.image = UIImage(named: $0)
            image.layer.cornerRadius = 15
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1).cgColor
            image.clipsToBounds = true
            discussUsersStackView.addArrangedSubview(image)
            
            image.snp.makeConstraints { $0.height.width.equalTo(35) }
            
            discussinView.snp.makeConstraints {
                $0.height.equalTo(70)
                $0.top.bottom.equalToSuperview()
                $0.leading.trailing.equalToSuperview().inset(12)
            }
        }
        
        discussingNowBtn.imageView?.snp.makeConstraints {
            $0.height.width.equalTo(35)
            $0.centerY.equalToSuperview()
        }
        
        discussingNowBtn.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.equalTo(discussinView.snp.leading)
            $0.bottom.equalToSuperview()
        }
        
        discussUsersStackView.snp.makeConstraints{
            $0.height.equalTo(35)
            $0.trailing.equalTo(discussinView.snp.trailing)
            $0.centerY.equalTo(discussingNowBtn.snp.centerY)
        }
    }
}

