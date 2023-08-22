//
//  CompletionGridView.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation
import SwiftUI

struct CompletionGridView: View {
    let completionCount: Int
    let taskIndex: Int
    @EnvironmentObject var taskViewModel: TaskViewModel

    var body: some View {
        VStack {
            ForEach(0..<7) { row in
                HStack {
                    ForEach(0..<7) { column in
                        if (row * 7 + column) < completionCount {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            Circle()
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    taskViewModel.markTaskComplete(at: taskIndex)
                                }
                        }
                    }
                }
            }
        }
    }
}


