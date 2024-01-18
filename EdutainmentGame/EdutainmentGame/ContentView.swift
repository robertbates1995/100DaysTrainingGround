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
    var gameState = gameState.setup
    var userAnswer = 0
    var score = 0
    var questions: [(Int, Int, Int)] = []
    
    enum gameState {
        case setup, playing, over
    }
    
    func startGame() {
        var temp = self.numberOfQuestions
        while temp > 0 {
            let temp1 = Int.random(in: 1...upperLimit)
            let temp2 = Int.random(in: 1...upperLimit)
            let answer = temp1 * temp2
            questions += [(temp1, temp2, answer)]
            temp -= 1
        }
        self.gameState = .playing
    }
    
    func questionSubmit() {
        if userAnswer == questions[numberOfQuestions - 1].2 {
            score += 1
        }
        numberOfQuestions -= 1
        if numberOfQuestions < 1 {
            self.gameState = .over
        }
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
                Stepper("\(model.upperLimit)", value: $model.upperLimit, in: model.upperLimitRange)
            }
            Section("Start Game") {
                Button("Start") {
                    model.startGame()
                }
            }
        }.navigationTitle("Starting Screen")
    }
    
    func gameView() -> some View {
        return List {
            Section("what is \(model.questions[model.numberOfQuestions - 1].0) x \(model.questions[model.numberOfQuestions - 1].1)") {
                TextField("test field", value: $model.userAnswer, format: .number)
                    .onSubmit {
                        model.questionSubmit()
                    }
            }
        }.navigationTitle("Game Screen")
    }
}

#Preview {
    ContentView()
}
