//
//  DiscussionTVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 21.09.2023.
//

import Foundation
import UIKit
import SnapKit

class DiscussionTVC: UITableViewCell {
    
    let avatars = ["avatar01", "avatar02", "avatar03", "avatar04"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DiscussionTVC {
    
    func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        // MARK: Configure views
        
        let wrapperView = UIView()
        wrapperView.backgroundColor = UIColor.clear
        
        let headerView = UIView()
        
        let circleView = UIView()
        circleView.layer.borderWidth = 8
        circleView.layer.borderColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1).cgColor
        circleView.layer.cornerRadius = 12
        
        let discussingLabel = UILabel()
        discussingLabel.text = "Now discussing"
        discussingLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        discussingLabel.numberOfLines = 0
        discussingLabel.adjustsFontSizeToFitWidth = true
        discussingLabel.textColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1)
        
        let avatarsStackView = UIStackView(arrangedSubviews: avatars.map ({ avatarName in
            let view = UIImageView()
            
            view.image = UIImage(named: avatarName)
            view.layer.cornerRadius = 16
            view.layer.borderColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1).cgColor
            view.layer.borderWidth = 1
            view.clipsToBounds = true
            
            view.snp.makeConstraints { make in
                make.width.height.equalTo(32)
            }
            
            return view
        }))
        avatarsStackView.axis = .horizontal
        avatarsStackView.spacing = -12
        
        let sectionView = UIView()
        sectionView.layer.cornerRadius = 12
        sectionView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        sectionView.layer.cornerCurve = .continuous
        sectionView.layer.borderWidth = 0.5
        sectionView.backgroundColor = UIColor.clear
        sectionView.clipsToBounds = true
        
        let sectionHeaderView = UIView()
        
        let sHeaderImageView = UIImageView()
        sHeaderImageView.image = UIImage(named: "avatar01")
        sHeaderImageView.contentMode = .scaleAspectFill
        sHeaderImageView.layer.cornerRadius = 20
        sHeaderImageView.clipsToBounds = true
        
        let sHeaderTitleLabel = UILabel()
        sHeaderTitleLabel.text = "Football news"
        sHeaderTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        sHeaderTitleLabel.numberOfLines = 0
        sHeaderTitleLabel.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
        sHeaderTitleLabel.textAlignment = .left
        sHeaderTitleLabel.textColor = .white
        
        let sHeaderSubtitleLabel = UILabel()
        sHeaderSubtitleLabel.text = "Juve, Ronaldo"
        sHeaderSubtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        sHeaderSubtitleLabel.numberOfLines = 0
        sHeaderSubtitleLabel.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
        sHeaderSubtitleLabel.textAlignment = .left
        sHeaderSubtitleLabel.textColor = .white
        
        let sHeaderStackView = UIStackView(arrangedSubviews: [sHeaderTitleLabel, sHeaderSubtitleLabel])
        sHeaderStackView.axis = .vertical
        sHeaderStackView.spacing = 4
        
        let sHeaderButton = UIButton()
        sHeaderButton.setImage(UIImage(named: "share")?.withTintColor(UIColor.white), for: .normal)
        sHeaderButton.tintColor = UIColor.white
        sHeaderButton.layer.cornerRadius = 18
        sHeaderButton.layer.borderWidth = 2
        sHeaderButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22).cgColor
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        
        let sectionBodyView = UIView()
        
        let sBodyDateDayLabel = UILabel()
        sBodyDateDayLabel.text = "22"
        sBodyDateDayLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        sBodyDateDayLabel.numberOfLines = 0
        sBodyDateDayLabel.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
        sBodyDateDayLabel.textAlignment = .center
        sBodyDateDayLabel.textColor = .white
        
        let sBodyDateMonthLabel = UILabel()
        sBodyDateMonthLabel.text = "Oct"
        sBodyDateMonthLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        sBodyDateMonthLabel.numberOfLines = 0
        sBodyDateMonthLabel.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
        sBodyDateMonthLabel.textAlignment = .center
        sBodyDateMonthLabel.textColor = .white
        
        let sBodyStackView = UIStackView(arrangedSubviews: [sBodyDateDayLabel, sBodyDateMonthLabel])
        sBodyStackView.axis = .vertical
        sBodyStackView.spacing = 0
        sBodyStackView.alignment = .center
        sBodyStackView.distribution = .fillProportionally
        
        let sBodyTextLabel = UILabel()
        sBodyTextLabel.text = "Ronaldo nominated for UEFA Men's Player ot the Year"
        sBodyTextLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        sBodyTextLabel.numberOfLines = 0
        sBodyTextLabel.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
        sBodyTextLabel.textAlignment = .left
        sBodyTextLabel.textColor = .white
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = sectionView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // MARK: Adding views
        
        contentView.addSubview(wrapperView)
        wrapperView.addSubview(headerView)
        wrapperView.addSubview(sectionView)
        
        headerView.addSubview(circleView)
        headerView.addSubview(discussingLabel)
        headerView.addSubview(avatarsStackView)
        
        sectionView.addSubview(sectionHeaderView)
        sectionView.addSubview(separatorView)
        sectionView.addSubview(sectionBodyView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        sectionHeaderView.addSubview(sHeaderImageView)
        sectionHeaderView.addSubview(sHeaderStackView)
        sectionHeaderView.addSubview(sHeaderButton)
        
        sectionBodyView.addSubview(sBodyStackView)
        sectionBodyView.addSubview(sBodyTextLabel)
        
        // MARK: Setup constraints
        
        wrapperView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(wrapperView)
        }
        
        circleView.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.top.left.equalTo(headerView)
            make.width.height.equalTo(24)
        }
        
        discussingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.left.equalTo(circleView.snp.right).offset(8)
            make.right.equalTo(avatarsStackView.snp.right).offset(-8)
        }
        
        avatarsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.right.equalTo(headerView.snp.right).offset(-8)
        }
        
        sectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalTo(wrapperView)
        }
        
        sectionHeaderView.snp.makeConstraints { make in
            make.top.equalTo(sectionView).inset(24)
            make.left.right.equalTo(sectionView).inset(16)
        }
        
        sHeaderImageView.snp.makeConstraints { make in
            make.centerY.equalTo(sectionHeaderView.snp.centerY)
            make.top.left.equalTo(sectionHeaderView)
            make.size.equalTo(40)
        }
        
        sHeaderStackView.snp.makeConstraints { make in
            make.centerY.equalTo(sectionHeaderView.snp.centerY)
            make.left.equalTo(sHeaderImageView.snp.right).offset(16)
            make.height.equalTo(sHeaderImageView.snp.height)
        }
        
        sHeaderButton.snp.makeConstraints { make in
            make.centerY.equalTo(sectionHeaderView.snp.centerY)
            make.right.equalTo(sectionHeaderView.snp.right)
            make.width.equalTo(36)
            make.height.equalTo(sHeaderButton.snp.width)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(sectionHeaderView.snp.bottom).offset(16)
            make.left.right.equalTo(sectionView).inset(16)
            make.height.equalTo(0.5)
        }
        
        sectionBodyView.snp.makeConstraints { make in
            make.top.equalTo(separatorView).inset(16)
            make.left.right.equalTo(sectionView).inset(16)
            make.bottom.equalTo(sectionView.snp.bottom).offset(-24)
        }
        
        sBodyStackView.snp.makeConstraints { make in
            make.top.left.equalTo(sectionBodyView)
            make.width.equalTo(44)
            make.height.equalTo(sBodyStackView.snp.width)
            make.centerY.equalTo(sectionBodyView.snp.centerY)
        }
        
        sBodyDateDayLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        sBodyDateMonthLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        sBodyTextLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(sectionBodyView)
            make.left.equalTo(sBodyStackView.snp.right).offset(8)
        }
    }
}

