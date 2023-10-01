//
//  TrophiesTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class TrophiesTableViewCell: UITableViewCell {

    var trophiesCollectionView: UICollectionView!
    let array: [(String, Int, UIImage)] = [
        ("European\nCup",            4, UIImage(named: "cup1") ?? UIImage()),
        ("FIFA Club\nWorld Cup",     3, UIImage(named: "cup2") ?? UIImage()),
        ("European\nsuper cup",      2, UIImage(named: "cup3") ?? UIImage()),
        ("FIFA Cup of\nChampions",   1, UIImage(named: "cup4") ?? UIImage())
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120.0, height: 150.0)
        layout.scrollDirection = .horizontal
        
        trophiesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        
        let cellTitle = UILabel()
        cellTitle.text = "TROPHIES"
        cellTitle.textColor = .white
        cellTitle.font = .systemFont(ofSize: 17, weight: .heavy)
        
        contentView.addSubview(cellTitle)
        cellTitle.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(16)
        }
        
        trophiesCollectionView.dataSource = self
        trophiesCollectionView.delegate = self
        
        trophiesCollectionView.register(TrophiesCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        
        trophiesCollectionView.backgroundColor = .clear
        
        contentView.addSubview(trophiesCollectionView)
        
        trophiesCollectionView.snp.makeConstraints {
            $0.top.equalTo(cellTitle.snp.bottom).inset(-16)
            $0.left.right.bottom.equalTo(contentView).inset(16)
            $0.height.equalTo(150)
        }
    }
}

extension TrophiesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? TrophiesCollectionViewCell
        if indexPath.item <= array.count {
            let trophyData = array[indexPath.item]
            cell?.dataArray = trophyData
            cell?.setup()
        }
        return cell ?? UICollectionViewCell()
    }
}
