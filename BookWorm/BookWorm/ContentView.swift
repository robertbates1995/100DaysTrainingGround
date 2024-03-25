//
//  ContentView.swift
//  BookWorm
//
//  Created by Robert Bates on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
