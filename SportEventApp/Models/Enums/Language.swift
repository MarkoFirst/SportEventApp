//
//  Language.swift
//  SportEvents
//
//  Created by Dima Kahanets on 20.08.2023.
//

import Foundation

enum Language {
    case english, ukrainian, spanish
    
    mutating func changeLanguage(to newLanguage: Language) {
        self = newLanguage
    }
}
