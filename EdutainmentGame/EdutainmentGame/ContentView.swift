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
    var limitRange = (2...12)
    var isPlaying = false
    var isOver = false
    
    func startGame() { }
    
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            if(model.isPlaying){
                
            } else {
                List {
                    Section("Number of Questions") {
                        Picker("", selection: $model.numberOfQuestions) {
                            ForEach(model.numberOfQuestionsRange, id: \.self) {
                                Text($0.formatted())
                            }
                        }.pickerStyle(.segmented)
                    }
                    Section("Upper Limit") {
                        Stepper("\(model.upperLimit)", value: $model.upperLimit, in: model.limitRange) { _ in
                            
                        }
                    }
                    Section("Start Game") {
                        Button("Start") {
                            
                        }
                    }
                }.navigationTitle("Edutainment App")
            }
        }
    }
}

#Preview {
    ContentView()
}
