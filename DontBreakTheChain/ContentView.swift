//
//  ContentView.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColßor(.accentColor)
            Text("Hello, Test!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
