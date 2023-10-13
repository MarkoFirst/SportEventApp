//
//  CoreDataService.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 13.10.2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EventCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        })
        return container
    }()
    
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError(nsError.localizedDescription)
            }
        }
    }
}

//class EventService: CoreDataService { 
//    var delegate = [EventCoreData]()
//    
//    func getAllEvents() {
//        do {
//            let context = CoreDataService().persistentContainer.viewContext
//            let delegate = try context.fetch(EventCoreData.fetchRequest())
//            print("Loaded \(delegate.count) items")
//            AddEventViewController().delegate = delegate
//        } catch {
//            
//        }
//    }
//    
//    func createEvent(eventName: UITextField, eventDescription: UITextField, firstTeam: UITextField, secondTeam: UITextField, eventImage: UIImageView, eventDate: UITextField) {
//        let context = CoreDataService().persistentContainer.viewContext
//        let item = EventCoreData(context: context)
//        item.eventName = eventName.text
//        item.eventDescription = eventDescription.text
//        item.firtsTeam = firstTeam.text
//        item.secondTeam = secondTeam.text
//        item.date = eventDate.text
//        if let image = eventImage.image {
//            if let imageData = image.pngData() {
//                item.eventImage = imageData
//            }
//        }
//        do {
//            try context.save()
//        } catch {
//            print("Ошибка при сохранении данных: \(error)")
//        }
//        getAllEvents()
//        delegate.append(item)
//    }
//    
//    func deleteEvent(item: EventCoreData) {
//        let context = CoreDataService().persistentContainer.viewContext
//        context.delete(item)
//        do {
//            try? context.save()
//        }
//    }
//}
//class UserService: CoreDataService {
//    
//}
