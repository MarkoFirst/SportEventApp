//
//  DiscussinTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 23.09.2023.
//

import Foundation
import UIKit
import SnapKit

//class DiscussinTVC: UITableViewCell {
//    
//    var disscussUsers = ["discussUser1", "discussUser2", "discussUser3", "discussUser4", "discussUser5"]
//    
//    let discussinView = UIView()
//    discussinView.backgroundColor = .clear
//    view.addSubview(discussinView)
//    discussinView.snp.makeConstraints {
//        $0.height.equalTo(60)
//        $0.top.equalToSuperview().inset(550)
//        $0.leading.trailing.equalToSuperview().inset(12)
//    }
//    
//    let discussingNowBtn = UIButton(type: .system)
//    discussingNowBtn.setTitle("Now discussing", for: .normal)
//    discussingNowBtn.setImage(UIImage(named: "discussLogo"), for: .normal)
//    discussingNowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//    discussingNowBtn.tintColor = UIColor(red: 0.106, green: 0.553, blue: 0.992, alpha: 1)
//    discussingNowBtn.imageView?.snp.makeConstraints {
//        $0.height.width.equalTo(35)
//        $0.centerY.equalToSuperview()
//    }
//    discussinView.addSubview(discussingNowBtn)
//    discussingNowBtn.snp.makeConstraints {
//        $0.height.equalTo(40)
//        $0.centerY.equalTo(discussinView.snp.centerY)
//        $0.leading.equalTo(discussinView.snp.leading).inset(0)
//    }
//    
//    let discussUsersStackView = UIStackView()
//    discussUsersStackView.axis = .horizontal
//    discussUsersStackView.spacing = -15
//    discussinView.addSubview(discussUsersStackView)
//    discussUsersStackView.snp.makeConstraints{
//        $0.height.equalTo(30)
//        $0.centerY.equalTo(discussinView.snp.centerY)
//        $0.trailing.equalTo(discussinView.snp.trailing).inset(0)
//    }
//    
//    for user in disscussUsers {
//        let image = UIImageView()
//        image.image = UIImage(named: user)
//        image.layer.cornerRadius = 15
//        image.layer.borderWidth = 1
//        image.layer.borderColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1).cgColor
//        image.clipsToBounds = true
//        discussUsersStackView.addArrangedSubview(image)
//        image.snp.makeConstraints{
//            $0.height.width.equalTo(30)
//        }
//    }
//}
