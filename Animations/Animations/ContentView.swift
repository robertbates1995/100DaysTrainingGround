//
//  ContentView.swift
//  Animations
//
//  Created by Robert Bates on 1/10/24.
//

import SwiftUI

@Observable
class ContentModel {
    var animationAmount = 1.0
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        Button("Tap Me") {
            model.animationAmount += 1.0
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(model.animationAmount)
        .blur(radius: (model.animationAmount - 1) * 3)
        .animation(.default, value: model.animationAmount)
    }
}

#Preview {
    ContentView()
}
