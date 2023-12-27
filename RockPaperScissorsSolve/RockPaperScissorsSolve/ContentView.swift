//
//  ContentView.swift
//  RockPaperScissorsSolve
//
//  Created by Robert Bates on 12/20/23.
//

import SwiftUI

@Observable
class ContentModel {
    var move: String
    var goal: String
    var winningMove = ""
    
    init() {
        self.move = ["rock", "paper", "scissors"].shuffled()[0]
        self.goal = ["lose", "win"].shuffled()[0]
        determineCorrectMove()
    }
    
    func determineCorrectMove() {
        if goal == "win" {
            if move == "rock" {
                winningMove = "paper"
            }
            if move == "paper" {
                winningMove = "scissors"
            }
            if move == "scissors" {
                winningMove = "rock"
            }
        } else {
            if move == "rock" {
                winningMove = "scissors"
            }
            if move == "paper" {
                winningMove = "rock"
            }
            if move == "scissors" {
                winningMove = "paper"
            }
        }
    }
}

struct ContentView: View {
    @State private var model: ContentModel
    
    init(model: ContentModel = ContentModel()) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            Text("Objective: \(model.goal) against \(model.move) using \(model.winningMove)")
            HStack{
                Button{
                    
                } label: {
                    Text("Rock")
                }
                Button{
                    
                } label: {
                    Text("Paper")
                }
                Button{
                    
                } label: {
                    Text("Scissors")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
