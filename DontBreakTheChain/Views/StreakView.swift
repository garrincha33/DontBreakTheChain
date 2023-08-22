//
//  StreakView.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation
import SwiftUI

struct StreakView: View {
    @EnvironmentObject var streakViewModel: StreakViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Current Streak")
                .font(.largeTitle)

            Text("\(streakViewModel.getCurrentStreak().days) days")
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
    }
}

