//
//  UserCD+CoreDataProperties.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 03.10.2023.
//
//

import Foundation
import CoreData


extension UserCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var password: String?
    @NSManaged public var userID: UUID?

}

extension UserCD : Identifiable {

}
