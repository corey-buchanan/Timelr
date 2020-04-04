//
//  TaskViewModel.swift
//  Timelr
//
//  Created by Corey Buchanan on 3/11/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class TaskViewModel : ObservableObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var taskList : [Task] = []
    
    // Dead code here - we need a mechanism for showing the error
    @Published var showError : Bool = false
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        let request = Task.getTasksRequest()
        
        do {
            taskList = try context.fetch(request)
        } catch {
            showError = true
        }
        
    }
    
    func createTask(title: String, due: Date, priority: Bool) {
        let task = Task(context: context)
        task.created = Date()
        task.title = title
        task.due = due
        task.priority = priority
        
        saveContext()
    }
    
    func deleteTask(at offsets: IndexSet) {
        for offset in offsets {
            let deletedTask = taskList[offset]
            context.delete(deletedTask)
        }
        
        saveContext()
    }
    
    func updateTask(task: Task, title: String, due: Date, priority: Bool) {
        task.setValue(title, forKey: "title")
        task.setValue(due, forKey: "due")
        task.setValue(priority, forKey: "priority")
        
        saveContext()
    }
    
    func saveContext() {
        
        if !context.hasChanges {
            return
        }
        
        do {
            try context.save()
            getTasks()
        } catch {
            showError = true
        }
    }
    
}
