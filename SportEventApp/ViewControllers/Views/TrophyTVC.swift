//
//  TrophyTVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 18.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TrophyTVC: UITableViewCell {
    
    private var sectionTitleLabel: UILabel!
    private var collectionView: UICollectionView!
    
    let trophies: [(UInt, String, UIImage?)] = [
        (8, "European cup", UIImage(named: "europeanCup")),
        (3, "FIFA Club World cup", UIImage(named: "fifaCup")),
        (3, "European super cup", UIImage(named: "superCup")),
        (1, "FIFA World cup", UIImage(named: "worldCup")),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TrophyTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trophies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let trophyCell = collectionView.dequeueReusableCell(withReuseIdentifier: TrophyCVC.trophyCellId, for: indexPath as IndexPath) as! TrophyCVC
        let trophyData = trophies[indexPath.item]
        
        trophyCell.configure(with: trophyData)
        
        return trophyCell
    }
}

extension TrophyTVC {
    
    private func setupView() {
        
        contentView.backgroundColor = UIColor(red: 0.055, green: 0.047, blue: 0.082, alpha: 1)
        
        // MARK: Configure views
        
            let sectionView = UIView()
            sectionView.layer.cornerRadius = 12
            sectionView.layer.cornerCurve = .continuous
            sectionView.clipsToBounds = true
            sectionView.backgroundColor = UIColor.clear
        
            sectionTitleLabel = UILabel()
            sectionTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            sectionTitleLabel.numberOfLines = 0
            sectionTitleLabel.adjustsFontSizeToFitWidth = true
            sectionTitleLabel.textColor = UIColor.white

            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 112.0, height: 148.0)
            layout.minimumLineSpacing = 8
            layout.scrollDirection = .horizontal
            
            collectionView = UICollectionView(frame: sectionView.frame, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.clipsToBounds = false
            collectionView.backgroundColor = UIColor.clear
            
            collectionView.register(TrophyCVC.self, forCellWithReuseIdentifier: TrophyCVC.trophyCellId)
            
            collectionView.delegate = self
            collectionView.dataSource = self
        
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.22)
        indicatorView.layer.cornerRadius = 2
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = sectionView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // MARK: Adding views
        
        contentView.addSubview(sectionView)
        
        sectionView.addSubview(sectionTitleLabel)
        sectionView.addSubview(collectionView)
        sectionView.addSubview(indicatorView)
        sectionView.addSubview(blurEffectView)
        sectionView.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        sectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(sectionView).inset(16)
            make.height.equalTo(24)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(sectionView).inset(16)
            make.height.equalTo(148)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(sectionView)
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.bottom.equalTo(sectionView.snp.bottom).offset(-12)
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
    }
    
    func configure(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}
