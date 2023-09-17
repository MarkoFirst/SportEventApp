
import Foundation

enum Theme {
    case dark, ligth
    mutating func toggleTheme() {
        switch self {
        case .dark:
            self = .dark
        case .ligth:
            self = .ligth
        }
    }
}
