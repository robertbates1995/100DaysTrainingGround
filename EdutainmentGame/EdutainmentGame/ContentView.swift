//
//  ContentView.swift
//  EdutainmentGame
//
//  Created by Robert Bates on 1/13/24.
//

import SwiftUI

@Observable
class ContentModel {
    var upperLimit = 1
    var numberOfQuestions = [5, 10, 20]
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        List {
            Section("Number of Questions") {
                Picker("", selection: $model.upperLimit) {
                    ForEach(model.numberOfQuestions, id: \.self) {
                        Text($0.formatted())
                    }
                }.pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ContentView()
}
