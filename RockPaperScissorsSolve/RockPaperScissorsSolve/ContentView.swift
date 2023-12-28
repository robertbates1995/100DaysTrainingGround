//
//  ContentView.swift
//  RockPaperScissorsSolve
//
//  Created by Robert Bates on 12/20/23.
//

import SwiftUI


@Observable
class ContentModel {
    
    enum Move: String, CaseIterable {
        case rock, paper, scissors
    }
    
    enum Goal: String, CaseIterable {
        case win, lose
    }
    
    var move: Move
    var goal: Goal
    var winningMove: Move {
        switch (move, goal) {
        case (.rock, .win):
            return .paper
        case (.rock, .lose):
            return .scissors
        case (.paper, .win):
            return .scissors
        case (.paper, .lose):
            return .rock
        case (.scissors, .win):
            return .rock
        case (.scissors, .lose):
            return .paper
        }
    }
    var points: Int = 0
    var totalAsked = 1
    var moveQueue: [(Move, Goal)]
    var isDone: Bool = false
    
    init() {
        self.move = Move.allCases.shuffled()[0]
        self.goal = Goal.allCases.shuffled()[0]
        self.moveQueue = (1...9).map{ _ in
            (Move.allCases.shuffled()[0], Goal.allCases.shuffled()[0])
        }
    }
    
    init(move: Move, goal: Goal, moveQueue: [(Move, Goal)] = []) {
        self.move = move
        self.goal = goal
        self.moveQueue = moveQueue
    }
    
    func choseMove(_ choice: Move) {
        if choice == winningMove {
            points += 1
        }
        if let temp = moveQueue.popLast(){
            move = temp.0
            goal = temp.1
            totalAsked += 1
        } else {
            isDone = true
        }
    }
}

struct ContentView: View {
    @State private var model: ContentModel
    
    init(model: ContentModel = ContentModel()) {
        self.model = model
    }
    
    var body: some View {
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
                ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            if(model.isDone == false) {
                VStack {
                    VStack {
                        Text("\(model.totalAsked) / 10")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                        Text("Current Score: \(model.points)")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    } .padding()
                    Text("\(model.goal.rawValue) against \(model.move.rawValue)")
                        .font(.largeTitle.lowercaseSmallCaps())
                        .foregroundStyle(.white)
                    Spacer(minLength: 200)
                    VStack {
                        Button{
                            model.choseMove(.rock)
                        } label: {
                            Image(.rock)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 50)
                        }
                        Button{
                            model.choseMove(.paper)
                        } label: {
                            Image(.rock)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 50)
                        }
                        Button{
                            model.choseMove(.scissors)
                        } label: {
                            Image(.rock)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 50)
                        }
                    }
                    Spacer()
                }
            } else {
                VStack {
                    Spacer()
                    VStack{
                        Text("GAME OVER")
                            .font(.largeTitle.bold())
                            .padding()
                        Text("Your Score: \(model.points)")
                            .font(.largeTitle.bold())
                    }
                    .padding()
                    .background(.gray.opacity(0.97))
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 50)
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
