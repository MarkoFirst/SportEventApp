//
//  HistoryTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 17.09.2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    let arrayOfYears: [Int] = [2017, 2018, 2019, 2020]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50.0, height: 20.0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40

        let historyCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        
        let cellTitle = UILabel()
        cellTitle.text = "HISTORY"
        cellTitle.textColor = .white
        cellTitle.font = .systemFont(ofSize: 17, weight: .heavy)
        
        historyCollectionView.backgroundColor = .clear
        historyCollectionView.isUserInteractionEnabled = true
        
        contentView.addSubview(cellTitle)
        contentView.addSubview(historyCollectionView)
        cellTitle.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(16)
        }
        
        historyCollectionView.snp.makeConstraints {
            $0.top.equalTo(cellTitle.snp.bottom).inset(-16)
            $0.left.right.equalTo(contentView).inset(16)
            $0.height.equalTo(20)
            $0.bottom.equalTo(contentView).inset(80)
        }
        
        let slider = UISlider()
        
        if let thumbImage = UIImage(named: "juventusLogoDesc") {
            let thumbSize = CGSize(width: 30, height: 30)
            let cornerRadius: CGFloat = thumbSize.width / 2.0

            UIGraphicsBeginImageContextWithOptions(thumbSize, false, 0.0)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(UIColor.clear.cgColor)
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: thumbSize), cornerRadius: cornerRadius).addClip()
            thumbImage.draw(in: CGRect(origin: .zero, size: thumbSize))
            let roundedThumbImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            slider.setThumbImage(roundedThumbImage, for: .normal)
            slider.tintColor = UIColor.red

            slider.isUserInteractionEnabled = false
            slider.setValue(0.65, animated: true)
        }
        
        contentView.addSubview(slider)
        
        slider.snp.makeConstraints {
            $0.left.equalTo(historyCollectionView.snp.left)
            $0.right.equalTo(historyCollectionView.snp.right)
            $0.top.equalTo(historyCollectionView.snp.bottom).offset(20)
        }
    }
}

extension HistoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfYears.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? HistoryCollectionViewCell
        if indexPath.item <= arrayOfYears.count {
            let yearsData = arrayOfYears[indexPath.item]
            cell?.arrayType = yearsData
            cell?.setup()
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .blue
        }
    }
}
