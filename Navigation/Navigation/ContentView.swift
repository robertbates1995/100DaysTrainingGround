//
//  ContentView.swift
//  Navigation
//
//  Created by Robert Bates on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
