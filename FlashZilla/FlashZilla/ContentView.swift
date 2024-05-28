//
//  ContentView.swift
//  FlashZilla
//
//  Created by Robert Bates on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onTapGesture(count: 2) {
                    print("Double tapped!")
                }
    }
}

#Preview {
    ContentView()
}
