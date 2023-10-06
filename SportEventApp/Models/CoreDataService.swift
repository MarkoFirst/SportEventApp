//
//  CoreDataService.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 03.10.2023.
//

import Foundation
import CoreData

class CoreDataService {
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Custom Functions
    
    func getUser() -> [UserCD] {
        let request = UserCD.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    func getEvents() -> [EventCD] {
        let request = EventCD.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    func createNewUser(firstName: String, email: String, password: String) {
        let user = UserCD(context: context)
        user.userID = UUID()
        user.firstName = firstName
        user.email = email
        user.password = password
        
        saveContext()
    }
    
    func createNewEvent(cover: Data, title: String, desc: String, firstTeam: String, secondTeam: String, date: Date) {
        let event = EventCD(context: context)
        event.eventID = UUID()
        event.eventCover = cover
        event.title = title
        event.desc = desc
        event.firstTeam = firstTeam
        event.secondTeam = secondTeam
        event.startDate = date
        
        saveContext()
    }
    
    func deleteEvent(event: EventCD) {
            let context = persistentContainer.viewContext
            context.delete(event)
            
            do {
                try context.save()
            } catch {
                print("Error: \(error)")
            }
        }
}
