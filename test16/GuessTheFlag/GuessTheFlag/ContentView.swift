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
                        } label: {
                            Image(model.countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 50)
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
