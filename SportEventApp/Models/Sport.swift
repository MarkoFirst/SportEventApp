import Foundation


class Sport: Favoritable {
    var isFavorite: Bool = false
    let type: SportType
    let equipment: [Equipment]

    init(type: SportType, equipment: [Equipment]) {
        self.type = type
        self.equipment = equipment
    }

    func toggleFavorite() {
            isFavorite.toggle()
        }
}
