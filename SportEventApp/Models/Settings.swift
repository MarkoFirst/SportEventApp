//
//  Settings.swift
//  SportEventApp
//
//  Created by Alena on 30.08.2023.
//

import Foundation

extension Settings {
    enum Theme {
        case black
        case white
    }
    
    enum Font {
        case arial
        case arialBlack
    }
    
    enum Language {
        case russian
        case ukrainian
        case english
    }
}

class Settings {
    var theme: Theme = .white
    var font: Font = .arial
    var language: Language = .ukrainian
}


