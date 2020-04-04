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
        
        let timeDifference = Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date, to: task.due)
        
        let numberSize: CGFloat = 20
        let labelSize: CGFloat = 12
        let numberWidth: CGFloat = 55
        
        return ZStack {
            
            if (task.due < date){
                Color(red: 201/255, green: 69/255, blue: 12/255)
            } else {
                Color(red: 0/255, green: 101/255, blue: 146/255)
            }
            
            VStack {
                Text(task.title).font(.custom("AvenirNext-Bold", size: 20))
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
            .padding(5)
        }
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
