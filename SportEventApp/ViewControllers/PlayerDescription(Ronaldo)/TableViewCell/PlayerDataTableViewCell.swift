//
//  PlayerDataTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 28.09.2023.
//

import UIKit

class PlayerDataTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let dataArray: [(String, Int)] = [("Age", 33), ("Games", 14), ("Goals", 10)]

        let spacing: CGFloat = 10
        let numberOfCells: CGFloat = 3
        let sizeOfCell = UIScreen.main.bounds.width / numberOfCells - spacing * (numberOfCells - 1)
  
        let playerDataStackView = UIStackView(arrangedSubviews: dataArray.compactMap({ text, nums in

            let squareCell = UIView() //cell with data
            squareCell.backgroundColor = #colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1).withAlphaComponent(0.87)
            
            squareCell.layer.cornerRadius = 10
            squareCell.heightAnchor.constraint(equalToConstant: sizeOfCell).isActive = true
            squareCell.widthAnchor.constraint(equalToConstant: sizeOfCell).isActive = true
            
            let titleLabel = UILabel()
            titleLabel.text = text
            titleLabel.textColor = .white
            titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
            squareCell.addSubview(titleLabel)
            
            titleLabel.snp.makeConstraints {
                $0.top.leading.equalTo(squareCell).inset(8)
            }
            
            let numberLabel = UILabel()
            numberLabel.text = nums.description
            numberLabel.textColor = .white
            numberLabel.font = .systemFont(ofSize: 20, weight: .heavy)
            squareCell.addSubview(numberLabel)
            
            numberLabel.snp.makeConstraints {
                $0.bottom.trailing.equalTo(squareCell).inset(8)
            }
            
            return squareCell
        }))
        
        playerDataStackView.axis = .horizontal
        playerDataStackView.spacing = spacing
        playerDataStackView.distribution = .fillEqually
        contentView.addSubview(playerDataStackView)
        
        playerDataStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(sizeOfCell)
        }
    }
}
