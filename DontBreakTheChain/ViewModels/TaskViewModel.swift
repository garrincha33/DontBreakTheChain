//
//  TaskViewModel.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let storage: Storageable
    private let tasksKey = "tasksKey"
    
    init(storage: Storageable = UserDefaultsStorage()) {
        self.storage = storage
        loadTasks()
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    func markTaskComplete(at index: Int) {
        tasks[index].isCompleted.toggle()
        if tasks[index].isCompleted {
            tasks[index].completionCount += 1
        } else {
            tasks[index].completionCount -= 1
        }
        saveTasks()
    }

    private func saveTasks() {
        storage.save(tasks, for: tasksKey)
    }
    
    private func loadTasks() {
        if let loadedTasks: [Task] = storage.load([Task].self, with: tasksKey) {
            self.tasks = loadedTasks
        }
    }
    
    func getAllTasks() -> [Task] {
        return tasks
    }
    
    func increaseCompletionCount(at index: Int) {
            tasks[index].completionCount += 1
            tasks[index].isCompleted = tasks[index].completionCount == 7
            saveTasks()
        }
    
    func decreaseCompletionCount(to value: Int, at index: Int) {
        tasks[index].completionCount = value
        tasks[index].isCompleted = tasks[index].completionCount == 7
        saveTasks()
    }


}
