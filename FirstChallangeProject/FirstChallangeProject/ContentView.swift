//
//  ContentView.swift
//  FirstChallangeProject
//
//  Created by Robert Bates on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingUnit = "Celcius"
    
    let units: [String] = ["°C", "°F", "K"]
    

    var body: some View {
        NavigationStack {
            Form {
                Section("starting Unit") {
                    Picker("starting Unit", selection: $startingUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

#Preview {
    ContentView()
}
