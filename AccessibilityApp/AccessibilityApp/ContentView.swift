//
//  ContentView.swift
//  AccessibilityApp
//
//  Created by Robert Bates on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("John Fitzgerald Kennedy") {
                print("Button tapped")
            }
            .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
