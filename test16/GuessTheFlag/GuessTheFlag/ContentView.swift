//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Bates on 10/30/23.
//

import SwiftUI

@Observable
class ContentModel {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    var showingScore = false
    var scoreTitle = ""
    var userScore = 0
    var totalAsked = 1
    var correctAnswer = Int.random(in: 0...2)
    var rotationAmounts = [0.0, 0, 0]
    var opacityAmounts = [1.0, 1, 1]
    var sizeAmounts = [1.0, 0, 0]
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            userScore += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong, that's \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        totalAsked += 1
    }
}

struct ContentView: View {
    @State private var model: ContentModel
    
    init(model: ContentModel = ContentModel()) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack(spacing: 30){
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15 ) {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(model.countries[model.correctAnswer])
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.semibold))
                    ForEach(0..<3) { number in
                        Button {
                            model.flagTapped(number)
                            withAnimation {
                                model.rotationAmounts[number] += 360
                                model.opacityAmounts[number] += 0.75
                                model.opacityAmounts = model.opacityAmounts.map({ $0 - 0.75 })
                            }
                        } label: {
                            Image(model.countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .opacity(model.opacityAmounts[number])
                                .scaleEffect(model.sizeAmounts[number])
                                .shadow(radius: 50)
                                .rotation3DEffect(.degrees(model.rotationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                }
                .alert(model.scoreTitle, isPresented: $model.showingScore) {
                    Button("Continue", action: model.askQuestion)
                } message: {
                    Text("Your score is: \(model.userScore)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
