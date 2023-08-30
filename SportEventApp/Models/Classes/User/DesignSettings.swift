//
//  Settings.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class DesignSettings {
    var theme: Theme
    var language: Language
    var pushNotification: PushNotification
    var font: FontType
    
    init(theme: Theme, language: Language, pushNotification: PushNotification, font: FontType) {
        self.theme = theme
        self.language = language
        self.pushNotification = pushNotification
        self.font = font
    }
    
    func changeTheme(element: Theme) {
        theme = element
    }
    
    func changeLanguage(element: Language) {
        language = element
    }
    
    func changePushNotofication(element: PushNotification) {
        pushNotification = element
    }
    
    func changeFont(element: FontType) {
        font = element
    }
    
}
