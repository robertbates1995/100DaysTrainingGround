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
    var dragAmount = CGSize.zero
}

struct ContentView: View {
    @Bindable var model = ContentModel()
    
    var body: some View {
        LinearGradient(
            colors: [.yellow, .red],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(width: 300, height: 200)
        .clipShape(.rect(cornerRadius: 10))
        .offset(model.dragAmount)
        .gesture(
            DragGesture()
                .onChanged { model.dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.bouncy) {
                        model.dragAmount = .zero
                    }
                }
        )
    }
}

#Preview {
    ContentView()
}
