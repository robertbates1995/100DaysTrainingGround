//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ContentModel {
    var tapCount = UserDefaults.standard.integer(forKey: "Tap")
}

struct ContentView: View {
   @State var model = ContentModel()
    
    var body: some View {
        Button("Tap Count: \(model.tapCount)") {
            model.tapCount += 1
            
            UserDefaults.standard.set(model.tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    ContentView()
}
