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
    var currentQuestion: questionData { questions[0] }
    var numberOfQuestions = 5
    var upperLimit = 10
    var upperLimitRange = (2...12)
    var gameState = gameState.playing
    var score = 0
    var questions: [questionData] = [
        questionData(limit: 10), questionData(limit: 10),
        questionData(limit: 10), questionData(limit: 10),
        questionData(limit: 10)
    ]
    
    enum gameState {
        case setup, playing, over
    }
    
    func startGame() {
        var temp = self.numberOfQuestions
        while temp > 0 {
            questions += [questionData(limit: upperLimit)]
            temp -= 1
        }
        self.gameState = .playing
    }
    
    func questionSubmit(_ userAnswer: Int) {
        if userAnswer == questions[0].correctAnswer {
            score += 1
        }
        questions.remove(at: 0)
        if questions.isEmpty {
            self.gameState = .over
        }
    }
}

extension ContentModel {
    class questionData {
        //Data Storage
        var limit: Int
        
        var leftNumber: Int
        var rightNumber: Int
        var correctAnswer: Int
        
        var topLeft: Int
        var topRight: Int
        var bottomLeft: Int
        var bottomRight: Int
        
        init(limit: Int) {
            self.limit = limit
            leftNumber = Int.random(in: 1...limit)
            rightNumber = Int.random(in: 1...limit)
            correctAnswer = leftNumber * rightNumber
            
            let upper = limit * limit
            let rawNumbers = [
                correctAnswer,
                Int.random(in: 0...upper),
                Int.random(in: 0...upper),
                Int.random(in: 0...upper)
            ].shuffled()
            
            topLeft = rawNumbers[0]
            topRight = rawNumbers[1]
            bottomLeft = rawNumbers[2]
            bottomRight = rawNumbers[3]
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
            Spacer()
            Text("Multiplication Quiz")
                .font(.system(size: 50).bold())
                .foregroundStyle(.white)
                .padding()
            Spacer()
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
                }
                .pickerStyle(.segmented)
                .opacity(1.0)
            }
            Spacer()
            VStack {
                Text("Upper Limit")
                    .padding()
                Stepper("\(model.upperLimit)", value: $model.upperLimit, in: model.upperLimitRange)
                    .padding()
            }
            Spacer()
            Button("Start Game") {
                model.startGame()
            }.padding()
        }
        .font(.largeTitle.bold())
        .foregroundStyle(.white)
    }
    
    func questionView() -> some View {
        return VStack {
            Text("Score: \(model.score)")
            Text("\(model.questions[0].leftNumber) x \(model.questions[0].rightNumber)")
                .font(.system(size: 80).bold())
                .foregroundStyle(.white)
                .padding()
            Spacer()
            VStack(alignment: .center) {
                buttonRow(
                    left: model.currentQuestion.topLeft,
                    right: model.currentQuestion.topRight
                ).padding()
                buttonRow(
                    left: model.currentQuestion.bottomLeft,
                    right: model.currentQuestion.bottomRight
                ).padding()
            }
        }
        .font(.system(size: 25))
        .foregroundStyle(.white)
    }
    
    func buttonRow(left: Int, right: Int) -> some View {
        return HStack(alignment: .center) {
            buttonView(left)
            Spacer()
            buttonView(right)
        }
    }
    
    func buttonView(_ value: Int) -> some View {
        var rotationValue = 0.0
        var oppacityValue = 1.0
        
        return ZStack {
            ZStack{
                ZStack {
                    ZStack {
                        Button("\(value)") {
                            model.questionSubmit(value)
                            withAnimation {
                                rotationValue += 360
                            }
                        }
                        .frame(maxWidth: 70, maxHeight: 70)
                        .font(.system(size: 36).bold())
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 10))
                        .rotation3DEffect(.degrees(rotationValue), axis: (x: 0, y: 1, z: 0))
                    }
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                }
                .background(.yellow)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            }
            .background(.red)
            .clipShape(.rect(cornerRadius: 10))
            .padding()
        }
        .background(.blue)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 30)
    }
    
    func endView() -> some View {
        VStack {
            Spacer()
            Text("GAME OVER")
                .font(.system(size: 55).bold())
                .padding()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text("Your Score:")
            ZStack {
                ZStack{
                    ZStack {
                        ZStack {
                            Text("\(model.score)")
                                .font(.system(size: 60))
                                .padding()
                                .padding()
                        }
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                    }
                    .background(.yellow)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                }
                .background(.red)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            }
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 50)
            Spacer()
            Button("New Game") {
                model = ContentModel()
            }
        }
        .foregroundStyle(.white)
        .font(.largeTitle.bold())
    }
}

#Preview {
    ContentView()
}
