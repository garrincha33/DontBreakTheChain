//
//  Home.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TaskView()
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet")
                }
            
            StreakView()
                .tabItem {
                    Label("Streak", systemImage: "flame.fill")
                }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

