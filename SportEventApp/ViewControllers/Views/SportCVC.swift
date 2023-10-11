//
//  SportCVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 05.09.2023.
//

import Foundation
import UIKit

@IBDesignable
class SportCVC: UICollectionViewCell {
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.contentView.backgroundColor = UIColor(red: 0.89, green: 0.922, blue: 1, alpha: 1)
                self.sportLabel.textColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1)
            }
            else
            {
                self.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
                self.sportLabel.textColor = UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1)
                
            }
        }
    }
    
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var sportLabel: UILabel!
    
}
