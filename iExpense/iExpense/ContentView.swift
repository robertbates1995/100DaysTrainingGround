//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

@Observable
class user {
    
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Bobby")
        }
    }
}

#Preview {
    ContentView()
}
