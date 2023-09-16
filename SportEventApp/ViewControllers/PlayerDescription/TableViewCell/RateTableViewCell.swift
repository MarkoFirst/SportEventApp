//
//  RateTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 16.09.2023.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    let gamesLabel = UILabel()
    let gamesView = UIView()
    let gamaesCount = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
