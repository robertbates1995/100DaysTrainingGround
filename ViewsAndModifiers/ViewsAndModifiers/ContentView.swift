//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Robert Bates on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText: Bool = false
    var buttonLabel: String = "test button label"
    
    var body: some View {
        Button(buttonLabel) {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ContentView()
}
