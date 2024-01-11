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
    var enabled = false
}

struct ContentView: View {
    @Bindable var model = ContentModel()
    
    var body: some View {
        Button("Tap me") {
            model.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(model.enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: model.enabled)
        .clipShape(.rect(cornerRadius: model.enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: model.enabled)
    }
}

#Preview {
    ContentView()
}
