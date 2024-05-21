//
//  ContentView.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
                // second
            }
        }
    }
}

#Preview {
    ContentView()
}
