//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Robert Bates on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("hello world")
        }
        .padding()
        .background(.red)
        .padding()
        .background(.orange)
        .padding()
        .background(.yellow)
        .padding()
        .background(.green)
        .padding()
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
