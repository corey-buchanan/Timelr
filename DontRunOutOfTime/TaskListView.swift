//
//  TaskListView.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/11/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var appTimer = AppTimer()
    
    @EnvironmentObject var taskViewModel : TaskViewModel
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                Divider()
                
                NavigationLink (destination: TaskEditView(title: "", due: Date(timeIntervalSinceNow: 86400))){
                    HStack {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 100.0, weight: .thin))
                        .accentColor(Color(.systemGreen))
                    }
                    .padding()
                }
                
                Divider()
                
                List {
                    ForEach(taskViewModel.taskList) { task in
                        
                        ZStack {
                            TaskView(date: self.appTimer.date, task: task)
                            NavigationLink (destination: TaskEditView(title: task.title, due: task.due, task: task)) {
                                EmptyView()
                            }
                        }
                        
                    }.onDelete(perform: taskViewModel.deleteTask(at:))
                }
            }
            .navigationBarTitle(Text("Todo"))
            
        }
        
    }
    
}



struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
