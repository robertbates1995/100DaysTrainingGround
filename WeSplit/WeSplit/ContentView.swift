//
//  ContentView.swift
//  WeSplit
//
//  Created by Robert Bates on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0)")
                        }
                    }
                }
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
