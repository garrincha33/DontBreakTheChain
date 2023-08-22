//
//  StreakViewModel.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

class StreakViewModel: ObservableObject, StreakManagable {
    
    @Published private var currentStreak: Streak = Streak()
    
    func incrementStreak() {
        currentStreak.days += 1
    }
    
    func resetStreak() {
        currentStreak.days = 0
    }
    
    func getCurrentStreak() -> Streak {
        return currentStreak
    }
    
    
}
