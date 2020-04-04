//
//  TaskEditView.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/12/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import SwiftUI

struct TaskEditView: View {
    
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State var title: String = ""
    @State var due: Date = Date(timeIntervalSinceNow: 86400)
    @State var priority: Bool = false
    
    @Binding var cancelled: Bool
    @Binding var task: Task?
    
    var body: some View {
            Form {
                Toggle(isOn: $priority, label: {
                    Text("Priority")
                })
                TextField("Task", text: $title)
                DatePicker(selection: $due) {
                    Text("Due Date")
                }
            }
            .onAppear(perform: updateEditFields)
            .onDisappear(perform: addTask)
    }
    
    func addTask() {
        if (cancelled) {
            return
        }
        
        if (task != nil) {
            taskViewModel.updateTask(task: task!, title: title, due: due, priority: priority)
        } else {
            if title != "" {
                taskViewModel.createTask(title: title, due: due, priority: priority)
            }
        }
    }
    
    func updateEditFields() {
        if (self.task != nil) {
            self.title = self.task!.title
            self.due = self.task!.due
            self.priority = self.task!.priority
        }
    }
    
}

struct TaskEditView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskEditView(cancelled: .constant(false), task: .constant(nil))
    }
}
