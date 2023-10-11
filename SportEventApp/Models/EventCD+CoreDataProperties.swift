//
//  EventCD+CoreDataProperties.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.10.2023.
//
//

import Foundation
import CoreData


extension EventCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventCD> {
        return NSFetchRequest<EventCD>(entityName: "EventCD")
    }

    @NSManaged public var eventID: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var firstTeam: String?
    @NSManaged public var secondTeam: String?
    @NSManaged public var eventCover: Data?

}

extension EventCD : Identifiable {

}
