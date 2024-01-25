//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct Secondview: View {
    var body: some View {
        Text("second View")
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            
        }
    }
}

#Preview {
    ContentView()
}
