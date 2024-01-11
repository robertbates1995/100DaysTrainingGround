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
    var isShowingRed = false
    var dragAmount = CGSize.zero
    var letters = Array("Hello SwiftUI")
}

struct ContentView: View {
    @Bindable var model = ContentModel()
    
    var body: some View {
        VStack {
            Button("Tap me") {
                model.isShowingRed.toggle()
            }
            
            if model.isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
