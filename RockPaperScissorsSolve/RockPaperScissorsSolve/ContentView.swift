//
//  ContentView.swift
//  RockPaperScissorsSolve
//
//  Created by Robert Bates on 12/20/23.
//

import SwiftUI

class ContentModel {
    var moves = ["rock", "paper", "scissors"].shuffled()
    var currentMove: String
    init() {
        self.currentMove = moves[0]
    }
}

struct ContentView: View {
    @State private var model: ContentModel
    
    init(model: ContentModel = ContentModel()) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            Text("What beats \(model.currentMove)?")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
