//
//  TaskViewModel.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

final class TaskViewModel: ObservableObject, TaskManaglable {
    
    @Published private var tasks: [Task] = []
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func markTaskComplete(at index: Int) {
        tasks[index].isCompleted = true
        tasks[index].completionCount += 1
    }

    
    func getAllTasks() -> [Task] {
        return tasks
    }

}
