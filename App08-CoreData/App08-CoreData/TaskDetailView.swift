//
//  TaskDetailView.swift
//  App08-CoreData
//
//  Created by Alumno on 18/10/21.
//

import SwiftUI
import CoreData

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    var task: Task
    @State var newTask: String = ""
    var mode: Mode
    
    var body: some View {
        VStack {
            TextField("Tarea", text: $newTask)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                if mode == .add {
                    addTask(newTask: newTask)
                } else {
                    editTask(newTask: newTask)
                }
          
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Image(systemName: mode == .add ? "square.and.arrow.down" : "pencil.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(mode == .add ? "Agregar" : "Editar")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(20)
        }
        .onAppear {
            if mode == .add {
                newTask = ""
            } else {
                newTask = task.task_wrapped
            }
        }
    }
    
    func addTask(newTask: String) {
        let addTask = Task(context: viewContext)
        addTask.task = newTask
        addTask.category_id = "01"
        addTask.priority_id = "01"
        addTask.is_completed = false
        addTask.date_created = Date()
        addTask.due_date = Date()

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func editTask(newTask: String) {
        
        viewContext.performAndWait {
            task.task = newTask
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }

    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(), mode: .add)
    }
}
