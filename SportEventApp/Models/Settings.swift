import Foundation
class Settings {
    var theme: Theme
    var language: Language
    var notificationsEnabled: Bool
    var preferredSportType: SportType

    init(theme: Theme = .dark, language: Language, preferredSportType: SportType) {
        self.theme = theme
        self.language = language
        self.notificationsEnabled = false
        self.preferredSportType = preferredSportType
    }

    func setTheme() {
        theme.toggleTheme()
    }

    func setLanguage() {
        language.changeLanguage(to: language)
    }
}
