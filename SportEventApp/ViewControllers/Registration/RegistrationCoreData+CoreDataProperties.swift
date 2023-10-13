//
//  RegistrationCoreData+CoreDataProperties.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 12.10.2023.
//
//

import Foundation
import CoreData


extension RegistrationCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegistrationCoreData> {
        return NSFetchRequest<RegistrationCoreData>(entityName: "RegistrationCoreData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension RegistrationCoreData : Identifiable {

}
