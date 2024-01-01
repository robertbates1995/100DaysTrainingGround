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
    var wakeUp = Date.now
    var now = Date.now
    var hour = Calendar.current.dateComponents([.hour], from: .now)
    var minute = Calendar.current.dateComponents([.minute], from: .now)
    private var components: DateComponents {
        Calendar.current.dateComponents([.hour, .minute], from: .now)
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

                // more to come
            }
        }
    }
}

#Preview {
    ContentView()
}
