//
//  TaskViewModel.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

class TaskViewModel: ObservableObject, TaskManaglable {
    
    @Published private var tasks: [Task] = []
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func markTaskComplete(at index: Int) {
        tasks[index].isCompleted = true
    }
    
    func getAllTasks() -> [Task] {
        return tasks
    }

}
