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
        Button("Tap Me") {
            // do nothing
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
    }
}

#Preview {
    ContentView()
}
