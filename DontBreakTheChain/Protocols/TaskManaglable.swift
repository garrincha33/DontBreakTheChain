//
//  TaskManaglable.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

protocol TaskManaglable {
    func addTask(_ task: Task)
    func markTaskComplete(at index: Int)
    func getAllTasks() -> [Task]
}
