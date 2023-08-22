//
//  DontBreakTheChainApp.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import SwiftUI

@main
struct DontBreakTheChainApp: App {
    let taskViewModel = TaskViewModel()
    let streakViewModel = StreakViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(taskViewModel)
                .environmentObject(streakViewModel)
        }
    }
}
