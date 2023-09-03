//
//  Settings.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 28.08.2023.
//

import Foundation

class Settings {
    var theme: Themes = .white
    var language: Language = .Ukrainian
    var pushStatus: Bool = false
    var push: [PushList] = []
    
    func setDarkTheme() {
        self.theme = .dark
    }
    
    func setWhiteTheme() {
        self.theme = .white
    }
    
    func changeLanguage(to newLanguage: Language) {
        self.language = newLanguage
    }
    
    func pushOff() {
        self.pushStatus = false
    }
    
    func addPush(push: [PushList]) {
        self.push = push
        self.pushStatus = true
    }
    
    func setDefault() {
        self.theme = .white
        self.language = .Ukrainian
        self.pushStatus = false
        self.push = []
    }
}
