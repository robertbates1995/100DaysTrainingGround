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
    var letters = Array("Hello SwiftUI")
}

struct ContentView: View {
    @Bindable var model = ContentModel()
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<model.letters.count, id: \.self) { num in
                Text(String(model.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(model.enabled ? .blue : .red)
                    .offset(model.dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: model.dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { model.dragAmount = $0.translation }
                .onEnded { _ in
                    model.dragAmount = .zero
                    model.enabled.toggle()
                }
        )
    }
}

#Preview {
    ContentView()
}
