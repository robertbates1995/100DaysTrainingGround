//
//  ContentView.swift
//  Navigation
//
//  Created by Robert Bates on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("row \(i)")
            }
            .navigationTitle("title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
