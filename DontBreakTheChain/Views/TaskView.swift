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
            
            Text("Dont Break The Chain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            HStack {
                TextField("Enter new task", text: $newTaskTitle)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8.0)
                
                Button("Add Task") {
                    let newTask = Task(title: newTaskTitle)
                    taskViewModel.addTask(newTask)
                    newTaskTitle = ""
                    self.endEditing()
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .foregroundColor(.white)
                .cornerRadius(15.0)
                .shadow(radius: 5)
            }
            .padding(.horizontal)

            Spacer().frame(height: 10)
            
            List {
                ForEach(taskViewModel.tasks) { task in
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
                            if let taskIndex = taskViewModel.tasks.firstIndex(of: task) {
                                    taskViewModel.increaseCompletionCount(at: taskIndex)
                                }
                        }
                        if let taskIndex = taskViewModel.getAllTasks().firstIndex(of: task) {
                            CompletionGridView(completionCount: task.completionCount, taskIndex: taskIndex)
                        }
                    }
                }
                .onDelete(perform: removeTasks)
            }
        }
        .padding(.bottom, 15)
    }
    
    private func removeTasks(at offSets: IndexSet) {
        taskViewModel.tasks.remove(atOffsets: offSets)
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

