//
//  TeacherTabBar.swift
//  SportEventApp
//
//  Created by MF-Citrus on 31.08.2023.
//

import Foundation
import UIKit

class TeacherTabBar: UITabBarController {
    
    enum TabItem: String {
        case Messi
        case collection
        case table
    }
    
    
    override func reloadInputViews() {
        print(#function)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        tabBar.standardAppearance =
        tabBar.items?.enumerated().forEach { (index, item) in
            
            
//            item.title = [TabItem.Messi, TabItem.collection, TabItem.table][index].rawValue
            
            item.badgeValue = 4.description
            
            item.image = #imageLiteral(resourceName: "image 4.pdf")
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        print(items)
    }
    
    override func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        print(items)
    }
}
