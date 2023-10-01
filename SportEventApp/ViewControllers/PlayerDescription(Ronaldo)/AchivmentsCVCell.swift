//
//  AchivmentsCVCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 14.09.2023.
//

import Foundation
import UIKit
import SnapKit

class AchivmentsCVCell: UICollectionViewCell {
    
    var collectionViewCell = UICollectionView()
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let nameOfStatLabel = UILabel()
    let statLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.collectionViewCell.delegate = self
//        self.collectionViewCell.dataSource = self
//        self.collectionViewCell.register(AchivmentsCVCell.self, forCellWithReuseIdentifier: "ageCell")
//        self.collectionViewCell.register(AchivmentsCVCell.self, forCellWithReuseIdentifier: "gamesCell")
//        self.collectionViewCell.register(AchivmentsCVCell.self, forCellWithReuseIdentifier: "goalsCell")
//        
//        view.backgroundColor = .gray
//        view.layer.cornerRadius = 10
//        collectionViewCell.addSubview(view)
        
        nameOfStatLabel.text = "Age"
        nameOfStatLabel.textColor = .white
        nameOfStatLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(nameOfStatLabel)

        statLabel.text = "33"
        statLabel.textColor = .white
        statLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(statLabel)

        nameOfStatLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).inset(4)
            $0.left.equalTo(view.snp.left).inset(4)
        }
            statLabel.snp.makeConstraints {
                $0.right.equalTo(view.snp.right).inset(4)
                $0.bottom.equalTo(view.snp.bottom).inset(4)

            }
        }
    }

    


//extension AchivmentsCVCell:  UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achivmentsCell", for: indexPath)
//        return cell
//    }
//}

/*
 let nameOfStatLabel = UILabel()
 nameOfStatLabel.text = "Age"
 nameOfStatLabel.textColor = .white
 nameOfStatLabel.font = .systemFont(ofSize: 20, weight: .semibold)
 view.addSubview(nameOfStatLabel)
 
 let statLabel = UILabel()
 statLabel.text = "33"
 statLabel.textColor = .white
 statLabel.font = .systemFont(ofSize: 20, weight: .semibold)
 view.addSubview(statLabel)
 
 nameOfStatLabel.snp.makeConstraints {
     $0.top.equalTo(view.snp.top).inset(4)
     $0.left.equalTo(view.snp.left).inset(4)
 
 statLabel.snp.makeConstraints {
     $0.right.equalTo(view.snp.right).inset(4)
     $0.bottom.equalTo(view.snp.bottom).inset(4)

 }
 
         let backView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
         backView.backgroundColor = .gray
         backView.layer.cornerRadius = 10
         collectionViewCell.addSubview(backView)
 */
