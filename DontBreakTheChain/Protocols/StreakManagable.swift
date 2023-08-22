//
//  StreakManagable.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

protocol StreakManagable {
    func incrementStreak()
    func resetStreak()
    func getCurrentStreak() -> Streak
}
