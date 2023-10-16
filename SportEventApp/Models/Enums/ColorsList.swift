//
//  ColorsList.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 10.10.2023.
//

import Foundation
import UIKit

enum ColorsList: String {
    case red
    case green
    case blue
    case yellow
    case orange
    case purple
    case brown
    case pink
    case gray
    case black
    case white
    
    var uiColor: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .green:
            return UIColor.green
        case .blue:
            return UIColor.blue
        case .yellow:
            return UIColor.yellow
        case .orange:
            return UIColor.orange
        case .purple:
            return UIColor.purple
        case .brown:
            return UIColor.brown
        case .pink:
            return UIColor.systemPink
        case .gray:
            return UIColor.gray
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        }
    }
}
