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
    var coffeeAmount = 1
    var wakeUp = Date.now
    
    func calculateBedtime() {
        
    }
}

struct ContentView: View {
    @State private var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: $model.wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(model.sleepAmount.formatted()) hours", value: $model.sleepAmount, in: 4...12, step: 0.25)
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(model.coffeeAmount) cup(s)", value: $model.coffeeAmount, in: 1...20)
            }.padding()
            .navigationTitle("BetterRest")
                .toolbar {
                    Button("Calculate", action: model.calculateBedtime)
                }
        }
    }
}

#Preview {
    ContentView()
}
