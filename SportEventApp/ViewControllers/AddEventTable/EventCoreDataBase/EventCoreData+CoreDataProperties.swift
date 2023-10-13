//
//  Event+CoreDataProperties.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 10.10.2023.
//
//

import Foundation
import CoreData


extension EventCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventCoreData> {
        return NSFetchRequest<EventCoreData>(entityName: "EventCoreData")
    }

    @NSManaged public var eventName: String?
    @NSManaged public var eventDescription: String?
    @NSManaged public var firtsTeam: String?
    @NSManaged public var secondTeam: String?
    @NSManaged public var date: String?
    @NSManaged public var eventImage: Data?

}

extension EventCoreData : Identifiable {

}
