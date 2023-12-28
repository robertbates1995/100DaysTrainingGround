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
        //if so display ending screen
    }
}

struct ContentView: View {
    @State private var model: ContentModel
    
    init(model: ContentModel = ContentModel()) {
        self.model = model
    }
    
    var isDoneView: some View {
        Text("Is Done")
    }
    
    var body: some View {
        if(model.isDone == false) {
            VStack {
                Text("Total Asked: \(model.totalAsked)")
                Text("Current Score: \(model.points)")
                Text("Objective: \(model.goal.rawValue) against \(model.move.rawValue) using \(model.winningMove.rawValue)")
                HStack{
                    Button{
                        model.choseMove(.rock)
                    } label: {
                        Text("Rock")
                    }
                    Button{
                        model.choseMove(.paper)
                    } label: {
                        Text("Paper")
                    }
                    Button{
                        model.choseMove(.scissors)
                    } label: {
                        Text("Scissors")
                    }
                }
            }
            .padding()
        } else {
            Text("Ending Screen")
        }
    }
}

#Preview {
    ContentView()
}
