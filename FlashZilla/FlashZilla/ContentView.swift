//
//  ContentView.swift
//  FlashZilla
//
//  Created by Robert Bates on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0

    var body: some View {
        Button("Hello, World!") {
            if reduceMotion {
                scale *= 1.5
            } else {
                withAnimation {
                    scale *= 1.5
                }
            }

        }
        .scaleEffect(scale)
    }
}

#Preview {
    ContentView()
}
