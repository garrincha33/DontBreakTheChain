//
//  Task.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id = UUID()
    let title: String
    var isCompleted = false
    var completionCount: Int = 0
   
}

