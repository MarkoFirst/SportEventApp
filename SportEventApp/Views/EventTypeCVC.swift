//
//  EventTypeCVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 06.09.2023.
//

import Foundation
import UIKit

@IBDesignable

class EventTypeCVC: UICollectionViewCell {
    let eventCellId = "eventCellId"
    
    @IBOutlet weak var backgroundViewCVC: UIView!
    @IBOutlet weak var typeEventIcon: UIImageView!
    @IBOutlet weak var labelCVC: UILabel!
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.backgroundViewCVC.backgroundColor = UIColor(red: 0.973, green: 0.38, blue: 0.267, alpha: 1)
            } else {
                self.backgroundViewCVC.backgroundColor = UIColor(red: 0.129, green: 0.208, blue: 0.318, alpha: 1)
            }
        }
    }
}


