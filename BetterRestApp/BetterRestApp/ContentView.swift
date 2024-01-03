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
    var wakeUp = defaultWakeTime
    var sleepAmount = 8.0
    var coffeeAmount = 1
    let sleepRange = 4...12
    let sleepStepValue = 0.25
    let coffeeRange = 0...20
    var alertTitle = ""
    var alertMessage = ""
    var showingAlert = false
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
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
    func desired() -> some View {
        Section("Desired amount of sleep") {
            Picker("Desired amount of sleep", selection: $model.sleepAmount) {
                ForEach(model.sleepRange, id: \.self) {
                    desiredText($0)
                }
            }
        }
    }
    
    func desiredText(_ label: Int) -> some View {
        Text("\(label)")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $model.wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                desired()
                Section("Daily coffee intake") {
                    Stepper(model.coffeeAmount == 0 ? "None" : "^[\(model.coffeeAmount) cup](inflect: true)", value: $model.coffeeAmount, in: model.coffeeRange)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: model.calculateBedtime)
            }
            .alert(model.alertTitle, isPresented: $model.showingAlert) {
                Button("OK") { }
            } message: {
                Text(model.alertMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
