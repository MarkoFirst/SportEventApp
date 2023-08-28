//
//  Settings.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class DesignSettings {
    let theme: Theme
    let language: Language
    let pushNotification: PushNotification
    let font: FontType
    init(theme: Theme, language: Language, pushNotification: PushNotification, font: FontType) {
        self.theme = theme
        self.language = language
        self.pushNotification = pushNotification
        self.font = font
    }
}
