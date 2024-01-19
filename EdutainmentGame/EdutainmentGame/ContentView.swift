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
        userAnswer = 0
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
            ZStack {
                RadialGradient(
                    stops: [
                        .init(color: .black, location: 0.25),
                        .init(color: .yellow, location: 0.25),
                        .init(color: .yellow, location: 0.3),
                        .init(color: .red, location: 0.3),
                        .init(color: .red, location: 0.35),
                        .init(color: .blue, location: 0.35),
                        .init(color: .blue, location: 0.4),
                        .init(color: .indigo, location: 0.4),
                    ],
                    center: .top,
                    startRadius: 200,
                    endRadius: 700
                )
                .ignoresSafeArea()
                switch model.gameState {
                case .setup:
                    setupView()
                case .playing:
                    questionView()
                case .over:
                    endView()
                }
            }
        }
    }
    
    func setupView() -> some View {
        return VStack {
            Text("Starting Screen")
                .font(.system(size: 50).bold())
                .foregroundStyle(.white)
                .padding()
            Spacer()
            Spacer()
            Spacer()
            VStack {
                Text("Number of Questions")
                    .padding()
                Picker("", selection: $model.numberOfQuestions) {
                    ForEach(model.numberOfQuestionsRange, id: \.self) {
                        Text($0.formatted())
                    }
                }.pickerStyle(.segmented)
            }
            Spacer()
            VStack {
                Text("Upper Limit")
                    .padding()
                Stepper("\(model.upperLimit)", value: $model.upperLimit, in: model.upperLimitRange)
            }
            Spacer()
            Button("Start Game") {
                model.startGame()
            }.padding()
        }
        .font(.system(size: 25))
        .foregroundStyle(.white)
    }
    
    func questionView() -> some View {
        return List {
            Section("what is \(model.questions[model.numberOfQuestions - 1].0) x \(model.questions[model.numberOfQuestions - 1].1)") {
                TextField("test field", value: $model.userAnswer, format: .number)
                    .onSubmit {
                        model.questionSubmit()
                    }
            }
            Section("Score") {
                Text("\(model.score)")
            }
        }.navigationTitle("Game Screen")
    }
    
    func endView() -> some View {
        return List {
            
        }
    }
}

#Preview {
    ContentView()
}
