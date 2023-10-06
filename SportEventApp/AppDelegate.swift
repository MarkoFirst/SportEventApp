//
//  AppDelegate.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit
import CoreData
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let config = Realm.Configuration(
            schemaVersion: 2, // Збільште номер версії, якщо ви змінюєте схему бази даних
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    // Додаємо код міграції для оновлення бази даних
                    // Наприклад, видалення полів, які були видалені зі структури
                    migration.deleteData(forType: User.className())
                }
            }
        )

        // Встановлюємо конфігурацію Realm з міграцією
        Realm.Configuration.defaultConfiguration = config

        do {
            // Відкриваємо базу даних з оновленою конфігурацією
            let realm = try Realm()
            // Тепер ви можете взаємодіяти з базою даних без отримання помилки міграції
        } catch {
            // Обробка помилок при відкритті бази даних
            print("Помилка при відкритті бази даних: \(error)")
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
