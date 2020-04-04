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
    
    @Binding var cancelled: Bool
    @Binding var task: Task?
    
    var body: some View {
        Form {
            TextField("Task", text: $title)
            DatePicker(selection: $due) {
                Text("Select Due Date")
            }
        }
        .onAppear(perform: {
            if (self.task != nil) {
                self.title = self.task!.title
                self.due = self.task!.due
            }
        })
        .onDisappear(perform: addTask)
    }
    
    func addTask() {
        if (cancelled) {
            return
        }
        
        if (task != nil) {
            taskViewModel.updateTask(task: task!, title: title, due: due)
        } else {
            if title != "" {
                taskViewModel.createTask(title: title, due: due)
            }
        }
    }
    
}

//struct TaskEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskEditView(task: Task(title: "Defeat ISIS", due: Date(timeIntervalSinceNow: 86400)), newTask: true)
//    }
//}
