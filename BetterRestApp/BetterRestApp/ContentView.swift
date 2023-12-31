//
//  ContentView.swift
//  BetterRestApp
//
//  Created by Robert Bates on 12/30/23.
//

import SwiftUI

@Observable
class ContentModel {
    var sleepAmount = 8.0
    
}

struct ContentView: View {
    @State private var model = ContentModel()
    
    var body: some View {
        Stepper("\(model.sleepAmount.formatted())", value: $model.sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    ContentView()
}
