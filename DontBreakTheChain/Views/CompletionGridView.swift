//
//  CompletionGridView.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation
import SwiftUI

struct CompletionGridView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let completionCount: Int
    let taskIndex: Int

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 25, maximum: 25), spacing: 8), count: 5), spacing: 8) {
            ForEach(0..<31) { index in
                ZStack {
                    Circle()
                        .fill(index < completionCount ? Color.green : Color.gray)
                        .frame(width: 25, height: 25)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .opacity(index < completionCount ? 1 : 0)
                        )
                        .onTapGesture {
                            if index == completionCount {
                                taskViewModel.increaseCompletionCount(at: taskIndex)
                            } else if index < completionCount {
                                taskViewModel.decreaseCompletionCount(to: index, at: taskIndex)
                            }
                        }
                }
            }
        }
    }
}
