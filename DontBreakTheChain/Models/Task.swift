//
//  Task.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
