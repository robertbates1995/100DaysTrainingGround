//
//  ContentView.swift
//  FirstChallangeProject
//
//  Created by Robert Bates on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingUnit = "°C"
    @State private var endingUnit = "°C"
    @State private var startingValue = 0.0
    @FocusState private var valueIsFocused: Bool
    
    var endingValue: Double {
        if(startingUnit == endingUnit) {
            return startingValue
        }
        if(startingUnit == "°C") {
            let celsius = Measurement(value: startingValue, unit: UnitTemperature.celsius)
            if(endingUnit == "°F") {
                return celsius.converted(to: .fahrenheit).value
            }
            return celsius.converted(to: .kelvin).value
        }
        if(startingUnit == "°F") {
            let fahrenheit = Measurement(value: startingValue, unit: UnitTemperature.fahrenheit)
            if(endingUnit == "°C") {
                return fahrenheit.converted(to: .celsius).value
            }
            return fahrenheit.converted(to: .kelvin).value
        }
        if(startingUnit == "K") {
            let kelven = Measurement(value: startingValue, unit: UnitTemperature.kelvin)
            if(endingUnit == "°C") {
                return kelven.converted(to: .celsius).value
            }
            return kelven.converted(to: .fahrenheit).value
        }
        return startingValue
    }
    
    let units = ["°C", "°F", "K"]
    

    var body: some View {
        NavigationStack {
            Form {
                Section("Starting value") {
                    TextField("inital value", value: $startingValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    Picker("Starting Unit", selection: $startingUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Ending value") {
                    Text(endingValue.description)
                    Picker("Ending Unit", selection: $endingUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar{
                if valueIsFocused {
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
