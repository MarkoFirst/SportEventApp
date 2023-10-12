//
//  TrophiesTVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 26.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TrophiesTVC: UITableViewCell {
    
    var athlete: Athlete?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrophiesTVC {
    
    
    private func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.016, green: 0.012, blue: 0.031, alpha: 1)
        
        let trophiesView = UIView()
        trophiesView.backgroundColor = UIColor(red: 0.09, green: 0.082, blue: 0.125, alpha: 1)
        trophiesView.layer.cornerRadius = 20
        contentView.addSubview(trophiesView)
        
        let trophiesLabel = UILabel()
        trophiesLabel.text = "TROPHIES"
        trophiesLabel.textColor = UIColor(red: 0.906, green: 0.902, blue: 0.925, alpha: 1)
        trophiesLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        trophiesLabel.adjustsFontSizeToFitWidth = true
        trophiesView.addSubview(trophiesLabel)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        trophiesView.addSubview(separatorView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset.left = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TrophiesCVC.self, forCellWithReuseIdentifier: "TrophiesCVC")
        trophiesView.addSubview(collectionView)
        
        let hideLine = UIView()
        hideLine.backgroundColor = UIColor(red: 0.376, green: 0.369, blue: 0.424, alpha: 0.5)
        trophiesView.addSubview(hideLine)
        
        trophiesView.snp.makeConstraints { $0.edges.equalToSuperview().inset(12) }
        
        trophiesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(trophiesLabel.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).inset(-12)
            $0.height.equalTo(trophiesView.snp.width).multipliedBy(0.5)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        
        hideLine.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.top.equalTo(collectionView.snp.bottom).inset(-16)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.bottom.equalTo(trophiesView.snp.bottom).inset(12)
        }
    }
}

extension TrophiesTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return athlete?.trophies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrophiesCVC", for: indexPath as IndexPath) as! TrophiesCVC
        
        cell.label.text = athlete?.trophies[indexPath.row].name
        cell.cupValue.text = athlete?.trophies[indexPath.row].count.description
        cell.image.image = athlete?.trophies[indexPath.row].icon
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height * 0.7, height: collectionView.frame.height)
    }
}
