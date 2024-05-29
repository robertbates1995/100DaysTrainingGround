//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
                .padding(20)
                .background(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
