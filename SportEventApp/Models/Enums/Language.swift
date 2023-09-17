

import Foundation

enum Language {
    case English, France, Ukrainian, Spanish
    
    mutating func chelengeLanguage(to newLanguage: Language) {
        self = newLanguage
    }
}
