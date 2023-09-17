//
//  TrophiesTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class TrophiesTableViewCell: UITableViewCell {
    

    let cellTitle = UILabel()
    var trophiesCollectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120.0, height: 150.0)
        layout.scrollDirection = .horizontal
        
        trophiesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
                
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
        trophiesCollectionView.register(Trophies2CollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        trophiesCollectionView.register(Trophies3CollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        trophiesCollectionView.register(Trophies4CollectionViewCell.self, forCellWithReuseIdentifier: "cell4")
        
        trophiesCollectionView.backgroundColor = .clear
        
        contentView.addSubview(trophiesCollectionView)
        
        trophiesCollectionView.snp.makeConstraints {
            $0.top.equalTo(cellTitle.snp.bottom).inset(-16)
            $0.left.right.equalTo(contentView).inset(16)
            $0.height.equalTo(150)
        }
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension TrophiesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.item {
        case 0:
            cell = trophiesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            return cell
        case 1:
            cell = trophiesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            return cell
        case 2:
            cell = trophiesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
            return cell
        case 3:
            cell = trophiesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath)
            return cell
        default:
            cell = UICollectionViewCell()
            return cell
        }
    }
}







//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
