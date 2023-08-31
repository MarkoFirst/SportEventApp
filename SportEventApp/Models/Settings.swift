import Foundation
enum Language {
    case english
    case spanish
    case german
    case french
    case italian
    case ukrainian
}
class Settings {
    var language: Language
    var theme: String
    var notificationsEnabled: Bool
    
    init(language: Language, theme: String, notificationsEnabled: Bool) {
        self.language = language
        self.theme = theme
        self.notificationsEnabled = notificationsEnabled
    }
}
