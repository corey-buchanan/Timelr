//
//  TaskView.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/11/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    var date: Date
    var task: Task
    
    var body: some View {
        VStack {
            Text(task.title).font(.headline)
            HStack {
                ZStack {
                    Circle().stroke(lineWidth: 4).foregroundColor(task.due.timeIntervalSinceNow > 0 ? .blue:.red)
                    VStack { Text(String(Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due).day!))
                        .frame(width: 55, height: 35)
                        .font(.custom("Futura", size: 25))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        
                        Text("D")
                        .font(.custom("Futura", size: 15))
                    }
                }
                ZStack {
                    Circle().stroke(lineWidth: 4).foregroundColor(task.due.timeIntervalSinceNow > 0 ? .blue:.red)
                    VStack { Text(String(Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due).hour!))
                        .frame(width: 55, height: 35)
                        .font(.custom("Futura", size: 25))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        
                        Text("H")
                        .font(.custom("Futura", size: 15))
                    }
                }
                ZStack {
                    Circle().stroke(lineWidth: 4).foregroundColor(task.due.timeIntervalSinceNow > 0 ? .blue:.red)
                    VStack { Text(String(Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due).minute!))
                        .frame(width: 55, height: 35)
                        .font(.custom("Futura", size: 25))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        
                        Text("M")
                        .font(.custom("Futura", size: 15))
                    }
                }
                ZStack {
                    Circle().stroke(lineWidth: 4).foregroundColor(task.due.timeIntervalSinceNow > 0 ? .blue:.red)
                    VStack { Text(String(Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due).second!))
                        .frame(width: 55, height: 35)
                        .font(.custom("Futura", size: 25))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        
                        Text("S")
                        .font(.custom("Futura", size: 15))
                    }
                }
            }
            .frame(height: 80)
        }
    }
}

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            TaskView(task: dummyTasks[0])
//            TaskView(task: dummyTasks[1])
//            TaskView(task: dummyTasks[2])
//        }
//        .previewLayout(.fixed(width: 300, height: 120))
//    }
//}
