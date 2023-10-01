//
//  Trophy.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 01.10.2023.
//

import Foundation
import UIKit

class Trophy {
    var name: String
    var count: UInt
    var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    init(name: String, count: UInt, iconName: String) {
        self.name = name
        self.count = count
        self.iconName = iconName
    }
}
