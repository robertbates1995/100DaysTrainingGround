//
//  ContentView.swift
//  Moonshot
//
//  Created by Robert Bates on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
