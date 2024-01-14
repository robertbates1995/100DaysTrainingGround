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
    var limitRange = (1...12)
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
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
        }
    }
}

#Preview {
    ContentView()
}
