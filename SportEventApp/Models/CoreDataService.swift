//
//  CoreDataService.swift
//  SportEventApp
//
//  Created by MF-Citrus on 21.09.2023.
//

import Foundation
import CoreData

class CoreDataService {
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func addUser(age: Int32, name: String, startDate: Date) {
        let user = UserCD(context: self.context)
        user.name = name
        user.age = age
        user.startDate = startDate
        user.id = UUID()
        
        saveContext()
    }
    
//    func addFavorite(_ user: UserCD, event: EventCD) {
//        user.addToFavoriteList(event)
//        saveContext()
//    }
    
    func removeUser(_ user: UserCD) {
        context.delete(user)
        saveContext()
    }
    
    func getUsers() -> [UserCD] {
        let request = UserCD.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "isAdmin = %@", "0")
        request.sortDescriptors = [
            NSSortDescriptor(key: #keyPath(UserCD.startDate), ascending: true)
        ]
        
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
            }
        }
    }
}
