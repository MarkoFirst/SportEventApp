//
//  HistoryTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var cellTitle = UILabel()
    var historyCollectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50.0, height: 20.0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        historyCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
                
        cellTitle.text = "HISTORY"
        cellTitle.textColor = .white
        cellTitle.font = .systemFont(ofSize: 17, weight: .heavy)
        
        historyCollectionView.backgroundColor = .clear
        historyCollectionView.isUserInteractionEnabled = true
        
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        historyCollectionView.register(History2CollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        historyCollectionView.register(History3CollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        historyCollectionView.register(History4CollectionViewCell.self, forCellWithReuseIdentifier: "cell4")
        
        contentView.addSubview(cellTitle)
        contentView.addSubview(historyCollectionView)
        cellTitle.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(16)
        }
        
        historyCollectionView.snp.makeConstraints {
            $0.top.equalTo(cellTitle.snp.bottom).inset(-16)
            $0.left.right.equalTo(contentView).inset(16)
            $0.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HistoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch indexPath.item {
        case 0:
            cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            return cell
        case 1:
            cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            return cell
        case 2:
            cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
            return cell
        case 3:
            cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath)
            return cell
        default:
            cell = UICollectionViewCell()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .blue
        }
    }
}

/*
 override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
 }

 override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)

     // Configure the view for the selected state
 }
 */
