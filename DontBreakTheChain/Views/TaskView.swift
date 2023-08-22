//
//  TaskView.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation
import SwiftUI

struct TaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var newTaskTitle = ""

    var body: some View {
        VStack(spacing: 20) {
            // Input Section
            HStack {
                TextField("Enter new task", text: $newTaskTitle)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8.0)
                
                Button("Add Task") {
                    let newTask = Task(title: newTaskTitle)
                    taskViewModel.addTask(newTask)
                    newTaskTitle = ""
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .foregroundColor(.white)
                .cornerRadius(15.0) // Increased corner radius for a smoother look
                .shadow(radius: 5)  // Added shadow for a slight elevation effect
            }
            .padding(.horizontal)

            Spacer().frame(height: 10)

            // Tasks List
            List {
                ForEach(taskViewModel.getAllTasks()) { task in
                    VStack {
                        HStack {
                            Text(task.title)
                            Spacer()
                            if task.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if let taskIndex = taskViewModel.getAllTasks().firstIndex(of: task) {
                                taskViewModel.markTaskComplete(at: taskIndex)
                            }
                        }
                        if let taskIndex = taskViewModel.getAllTasks().firstIndex(of: task) {
                            CompletionGridView(completionCount: task.completionCount, taskIndex: taskIndex)
                        }
                    }
                }
            }
        }
        .padding(.bottom, 15)
    }
}
