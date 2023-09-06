//
//  Theme.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

enum Theme {
    case light, dark
  
    mutating func toggleTheme() {
        switch self {
        case .light:
            self = .dark
        case .dark:
            self = .light
        }
    }
    
}
