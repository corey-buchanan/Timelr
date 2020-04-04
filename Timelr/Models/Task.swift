//
//  Task.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/11/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import Foundation
import CoreData

public class Task : NSManagedObject, Identifiable {
    
    @NSManaged public var created : Date
    @NSManaged public var title: String
    @NSManaged public var due: Date
    @NSManaged public var priority: Bool
    
    static func getTasksRequest() -> NSFetchRequest<Task> {
        let request : NSFetchRequest<Task> = NSFetchRequest<Task>(entityName: "Task")
        request.sortDescriptors = [NSSortDescriptor(key: "due", ascending: true)]
        
        return request
    }
    
}
