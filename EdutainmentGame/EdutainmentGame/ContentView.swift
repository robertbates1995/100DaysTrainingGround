//
//  ContentView.swift
//  EdutainmentGame
//
//  Created by Robert Bates on 1/13/24.
//

import SwiftUI



@Observable
class ContentModel {
    var numberOfQuestionsRange = [5, 10, 20]
    var numberOfQuestions = 5
    var upperLimit = 10
    var upperLimitRange = (2...12)
    var gameState = gameState.playing
    var score = 0
    
    enum gameState {
        case setup, playing, over
    }
    
    func startGame() {
        
    }
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            switch model.gameState {
            case .setup:
                setupView()
            case .playing:
                gameView()
            case .over:
                Text("over test string")
            }
        }
    }
    
    func setupView() -> some View {
        return List {
            Section("Number of Questions") {
                Picker("", selection: $model.numberOfQuestions) {
                    ForEach(model.numberOfQuestionsRange, id: \.self) {
                        Text($0.formatted())
                    }
                }.pickerStyle(.segmented)
            }
            Section("Upper Limit") {
                Stepper("\(model.upperLimit)", value: $model.upperLimit, in: model.upperLimitRange) { _ in
                    
                }
            }
            Section("Start Game") {
                Button("Start") {
                    model.gameState = .playing
                }
            }
        }.navigationTitle("Starting Screen")
    }
    
    func gameView() -> some View {
        if model.numberOfQuestions > 0 {
            model.gameState = .over
        }
        return List {
            Section("current Question") {
                    
            }
        }.navigationTitle("Game Screen")
    }
}

#Preview {
    ContentView()
}
