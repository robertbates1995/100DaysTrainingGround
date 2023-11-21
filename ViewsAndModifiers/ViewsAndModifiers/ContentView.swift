//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Robert Bates on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText: Bool = false
    
    var body: some View {
        Button("hello world") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ContentView()
}
