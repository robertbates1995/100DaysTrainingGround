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
            //model.animationAmount += 1.0
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(model.animationAmount)
                .opacity(2 - model.animationAmount)
                .animation(
                    .easeInOut(duration: 0.5)
                    .repeatCount(2, autoreverses: false),
                    value: model.animationAmount
                )
        )
        .onAppear {
            model.animationAmount = 2
        }
    }
}

#Preview {
    ContentView()
}
