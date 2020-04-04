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
    
    @State var showEdit = false
    @State var editedTask : Task?
    
    init() {
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                if (!showEdit) {
                    Button(action: {self.showEdit = true}, label: {
                        Image("TimelrPlus")
                        .resizable()
                        .frame(width: 64, height: 64)
                    }).buttonStyle(PlainButtonStyle())
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .padding()
                } else {
                    HStack {
                        Button(action: {self.showEdit = false}, label: {
                            Image("TimelrPlus")
                            .resizable()
                            .frame(width: 64, height: 64)
                        }).buttonStyle(PlainButtonStyle())
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .rotationEffect(Angle(degrees: 45))
                            .padding()
                        Button(action: {self.showEdit = false}, label: {
                            Image("TimelrPlus")
                            .resizable()
                            .frame(width: 64, height: 64)
                        }).buttonStyle(PlainButtonStyle())
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .padding()
                    }
                    
                }
                
                if (showEdit) {
                    TaskEditView(task: editedTask)
                }
                
                List {
                    ForEach(taskViewModel.taskList) { task in
                        TaskView(date: self.appTimer.date, task: task)
                    }
                    .onDelete(perform: taskViewModel.deleteTask(at:))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskListView().environmentObject(TaskViewModel())
    }
}
