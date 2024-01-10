//
//  ContentView.swift
//  Animations
//
//  Created by Robert Bates on 1/10/24.
//

import SwiftUI

struct ContentModel: Equatable {
    var animationAmount = 1.0
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
