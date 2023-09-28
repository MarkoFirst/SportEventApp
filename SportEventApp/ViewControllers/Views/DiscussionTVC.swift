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
    
    private var wrapperView = UIView()
    private var headerView = UIView()
    private var circleView = UIView()
    private var discussingLabel = UILabel()
    private var avatarsStackView = UIStackView()
    private var sectionView = UIView()
    private var sHeaderImageView = UIImageView()
    private var sHeaderStackView = UIStackView()
    private var sHeaderTitleLabel = UILabel()
    private var sHeaderSubtitleLabel = UILabel()
    private var sHeaderButton = UIButton()
    private var sectionHeaderView = UIView()
    private var separatorView = UIView()
    private var sectionBodyView = UIView()
    private var sBodyStackView = UIStackView()
    private var sBodyDateDayLabel = UILabel()
    private var sBodyDateMonthLabel = UILabel()
    private var sBodyTextLabel = UILabel()

    
    let avatars = ["Avatar", "Avatar", "Avatar", "Avatar"]
    
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
        
        wrapperView = {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            
            return view
        }()
        
        circleView = {
            let view = UIView()
            view.layer.borderWidth = 8
            view.layer.borderColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1).cgColor
            view.layer.cornerRadius = 12
            
            return view
        }()
        
        discussingLabel = {
            let label = UILabel()
            label.text = "Now discussing"
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1)
            
            return label
        }()
        
        avatarsStackView = {
            let stackView = UIStackView(arrangedSubviews: avatars.map ({ avatarName in
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
            stackView.axis = .horizontal
            stackView.spacing = -12
            
            return stackView
        }()
        
        sectionView = {
            let view = UIView()
            view.layer.cornerRadius = 12
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.cornerCurve = .continuous
            view.layer.borderWidth = 0.5
            view.backgroundColor = UIColor.clear
            view.clipsToBounds = true
            
            return view
        }()
        
        sHeaderImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Avatar")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 18
            imageView.clipsToBounds = true
            
            return imageView
        }()
        
        sHeaderStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 4
            
            return stackView
        }()
        
        sHeaderTitleLabel = {
            let label = UILabel()
            label.text = "Football news"
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
            label.textAlignment = .left
            label.textColor = .white
            
            return label
        }()
        
        sHeaderSubtitleLabel = {
            let label = UILabel()
            label.text = "Juve, Ronaldo"
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
            label.textAlignment = .left
            label.textColor = .white
            
            return label
        }()
        
        sHeaderButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "share")?.withTintColor(UIColor.white), for: .normal)
            button.tintColor = UIColor.white
            button.layer.cornerRadius = 18
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22).cgColor
            
            return button
        }()
        
        separatorView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
            
            return view
        }()
        
        sectionBodyView = {
            let view = UIView()
            
            return view
        }()
        
        sBodyStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            
            return stackView
        }()
        
        sBodyDateDayLabel = {
            let label = UILabel()
            label.text = "22"
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
            label.textAlignment = .center
            label.textColor = .white
            
            return label
        }()
        
        sBodyDateMonthLabel = {
            let label = UILabel()
            label.text = "Oct"
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
            label.textAlignment = .center
            label.textColor = .white
            
            return label
        }()
        
        sBodyTextLabel = {
            let label = UILabel()
            label.text = "Ronaldo nominated for UEFA Men's Player ot the Year"
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 0.145, green: 0.545, blue: 0.961, alpha: 1)
            label.textAlignment = .left
            label.textColor = .white
            
            return label
        }()
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView: UIVisualEffectView = {
            let blur = UIVisualEffectView(effect: blurEffect)
            blur.frame = sectionView.bounds
            blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            return blur
        }()
        
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
        
        sHeaderStackView.addArrangedSubview(sHeaderTitleLabel)
        sHeaderStackView.addArrangedSubview(sHeaderSubtitleLabel)
        
        sectionBodyView.addSubview(sBodyStackView)
        sectionBodyView.addSubview(sBodyTextLabel)
        
        sBodyStackView.addArrangedSubview(sBodyDateDayLabel)
        sBodyStackView.addArrangedSubview(sBodyDateMonthLabel)
        
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
            make.width.equalTo(40)
            make.height.equalTo(sHeaderImageView.snp.width)
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

