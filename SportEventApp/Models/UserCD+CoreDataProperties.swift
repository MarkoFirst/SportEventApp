//
//  UserCD+CoreDataProperties.swift
//  
//
//  Created by MF-Citrus on 21.09.2023.
//
//

import Foundation
import CoreData


@objc(UserCD)
public class UserCD: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var age: Int32
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var isAdmin: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var favoriteList: NSSet?

}

// MARK: Generated accessors for favoriteList
extension UserCD {

    @objc(addFavoriteListObject:)
    @NSManaged public func addToFavoriteList(_ value: EventCD)

    @objc(removeFavoriteListObject:)
    @NSManaged public func removeFromFavoriteList(_ value: EventCD)

    @objc(addFavoriteList:)
    @NSManaged public func addToFavoriteList(_ values: NSSet)

    @objc(removeFavoriteList:)
    @NSManaged public func removeFromFavoriteList(_ values: NSSet)

}
