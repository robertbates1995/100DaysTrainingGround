//
//  ContentView.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show tab 2") {
                selectedTab = "Two"
            }
            .tabItem { Label("One", systemImage: "star") }
            .tag("One")
            Button("Show tab 1") {
                selectedTab = "One"
            }
            .tabItem { Label("Two", systemImage: "circle") }
            .tag("Two")
        }
    }
}

#Preview {
    ContentView()
}
