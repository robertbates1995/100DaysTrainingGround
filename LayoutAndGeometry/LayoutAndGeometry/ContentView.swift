//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("hello world")
            .position(x: 100, y: 100)
            .background(.red)
        Text("hello world")
            .offset(x: 100, y: -100)
            .background(.red)
            .padding()
    }
}

#Preview {
    ContentView()
}
