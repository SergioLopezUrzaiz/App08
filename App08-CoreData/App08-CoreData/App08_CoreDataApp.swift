//
//  App08_CoreDataApp.swift
//  App08-CoreData
//
//  Created by Alumno on 18/10/21.
//

import SwiftUI

@main
struct App08_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
