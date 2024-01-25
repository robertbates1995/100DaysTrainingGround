//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ContentModel {
    @AppStorage("tapCount") var tapCount = 0
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
