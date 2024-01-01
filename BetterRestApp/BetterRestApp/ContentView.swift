//
//  ContentView.swift
//  BetterRestApp
//
//  Created by Robert Bates on 12/30/23.
//

import CoreML
import SwiftUI

@Observable
class ContentModel {
    var wakeUp = Date.now
    var sleepAmount = 8.0
    var coffeeAmount = 1
    let sleepRange: ClosedRange<Double> = 4...12
    let sleepStepValue = 0.25
    let coffeeRange = 0...20
    
    var alertTitle = ""
    var alertMessage = ""
    var showingAlert = false
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediciton = try model.prediction(wake: Int64((hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let bedTime = wakeUp - prediciton.actualSleep
            alertTitle = "Your bedtime is..."
            alertMessage = bedTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an issue calculating your bedtime."
        }
        showingAlert = true
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
                Stepper("\(model.sleepAmount.formatted()) hours", value: $model.sleepAmount, in: model.sleepRange, step: model.sleepStepValue)
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(model.coffeeAmount) cup(s)", value: $model.coffeeAmount, in: model.coffeeRange)
            }.padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: model.calculateBedtime)
            }
            .alert(model.alertTitle, isPresented: $model.showingAlert) {
                Button("OK") { }
            }message: {
                Text(model.alertMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
