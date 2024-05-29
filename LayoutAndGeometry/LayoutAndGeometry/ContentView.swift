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
            Text("Hello, World!")
                .frame(width: 300, height: 300, alignment: .topLeading)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
