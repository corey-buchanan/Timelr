//
//  TaskView.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/11/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject var taskViewModel : TaskViewModel
    
    var date: Date
    var task: Task
    
    var body: some View {
        
        let timeDifference = Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due)
        
        let numberSize: CGFloat = 20
        let labelSize: CGFloat = 12
        let numberWidth: CGFloat = 60
        
        return ZStack {
            
            if (task.due < date){
                Color(red: 184/255, green: 37/255, blue: 4/255)
            } else {
                Color(red: 0/255, green: 101/255, blue: 146/255)
            }
            
            HStack {
                VStack {
                    
                    Text(task.title).font(.custom("AvenirNext-Bold", size: 20))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                        
                    HStack {
                        VStack { Text(String((timeDifference).day!))
                            .font(.custom("Futura", size: numberSize))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            Text("D")
                            .font(.custom("Futura", size: labelSize))
                        }
                        .frame(width: numberWidth)
                    
                    
                        VStack { Text(String((timeDifference).hour!))
                            .font(.custom("Futura", size: numberSize))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            Text("H")
                            .font(.custom("Futura", size: labelSize))
                        }
                        .frame(width: numberWidth)
                    
                    
                        VStack { Text(String((timeDifference).minute!))
                            .font(.custom("Futura", size: numberSize))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            Text("M")
                            .font(.custom("Futura", size: labelSize))
                        }
                        .frame(width: numberWidth)
                    
                    
                        VStack { Text(String((timeDifference).second!))
                            .font(.custom("Futura", size: numberSize))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            Text("S")
                            .font(.custom("Futura", size: labelSize))
                        }
                        .frame(width: numberWidth)
                        
                        }
                    
                    }.foregroundColor(Color.white)
                
                Spacer()
                
                Button(action: toggglePriority, label: {
                    if (task.priority) {
                        Image(systemName: "star.fill").foregroundColor(.white)
                    } else {
                        Image(systemName: "star").foregroundColor(.white)
                    }
                }).font(.largeTitle)
                
            }.padding(.horizontal, 10)
                .padding(.vertical, 5)
            
        }
    }
    
    func toggglePriority() {
        print("Toggling")
        taskViewModel.updateTask(task: task, title: task.title, due: task.due, priority: !task.priority)
    }
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Task.getTasksRequest()
        
        let taskList = try! context.fetch(request)
        
        return Group {
            TaskView(date: Date(), task: taskList[0])
            TaskView(date: Date(), task: taskList[1])
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
