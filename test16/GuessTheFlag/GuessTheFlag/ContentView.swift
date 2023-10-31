//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Bates on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red.ignoresSafeArea()
                Color.blue.ignoresSafeArea()
            }
            Text("Hello, world!")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    ContentView()
}
