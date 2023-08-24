//
//  DontBreakTheChainApp.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import SwiftUI

@main
struct DontBreakTheChainApp: App {
    let streakViewModel = StreakViewModel()
    var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(taskViewModel)
                .environmentObject(streakViewModel)
        }
    }
}
