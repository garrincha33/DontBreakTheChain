//
//  StreakViewModel.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

final class StreakViewModel: ObservableObject {
    
    @Published private var currentStreak: Streak = Streak() {
        didSet {
            saveStreak()
        }
    }
    
    private let storage: Storageable
    private let streakKey = "streakKey"
    
    init(storage: Storageable = UserDefaultsStorage()) {
        self.storage = storage
        loadStreak()
    }
    
    func incrementStreak() {
        currentStreak.days += 1
    }
    
    func decrementStreak() {
        if currentStreak.days > 0 {
            currentStreak.days -= 1
        }
    }
    
    func resetStreak() {
        currentStreak.days = 0
    }
    
    func getCurrentStreak() -> Streak {
        return currentStreak
    }
    
    private func saveStreak() {
        storage.save(currentStreak, for: streakKey)
    }
    
    private func loadStreak() {
        if let loadedStreak: Streak = storage.load(Streak.self, with: streakKey) {
            self.currentStreak = loadedStreak
        }
    }
}
