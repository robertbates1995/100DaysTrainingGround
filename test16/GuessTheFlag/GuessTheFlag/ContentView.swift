//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Bates on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red.ignoresSafeArea()
                Color.yellow.ignoresSafeArea()
            }
            Button {
                print("button was tapped")
                showingAlert = true
            } label: {
                Label("test button", systemImage: "pencil")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("this is a test message")
            }
        }
    }
}

#Preview {
    ContentView()
}
