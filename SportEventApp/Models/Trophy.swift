//
//  Trophy.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 01.10.2023.
//

import Foundation
import UIKit
import RealmSwift

class Trophy: Object {
    @Persisted var name: String
    @Persisted var count: Int
    @Persisted var iconName: String
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    convenience init(name: String, count: Int, iconName: String) {
        self.init()
        self.name = name
        self.count = count
        self.iconName = iconName
    }
}
