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
    let sleepRange = (0...32).map({Double($0) * 0.25 + 4})
    let sleepStepValue = 0.25
    let coffeeRange = 0...20
    var bedTimeTitle: String? {calculateBedTimeTitle()}
    var bedTimeMessage: String? {calculateBedTimeMessage()}
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    func calculateBedTimeTitle() -> String? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediciton = try model.prediction(wake: Int64((hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            return "Your bedtime is..."
        } catch {
            return nil
        }
    }
    
    func calculateBedTimeMessage() -> String? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediciton = try model.prediction(wake: Int64((hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let bedTime = wakeUp - prediciton.actualSleep
            return bedTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return nil
        }
    }
}

struct ContentView: View {
    
    @State private var model = ContentModel()
    
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
                if(model.bedTimeTitle != nil && model.bedTimeMessage != nil) {
                    Text(model.bedTimeTitle!)
                    Text(model.bedTimeMessage!).font(.largeTitle.bold())
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func desired() -> some View {
        Section("Desired amount of sleep") {
            Picker("Desired amount of sleep", selection: $model.sleepAmount) {
                ForEach(model.sleepRange, id: \.self) {
                    desiredText($0)
                }
            }
        }
    }
    func desiredText(_ label: Double) -> some View {
        Text(label.formatted())
    }
}

#Preview {
    ContentView()
}
