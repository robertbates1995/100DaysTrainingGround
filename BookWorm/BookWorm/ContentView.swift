//
//  ContentView.swift
//  BookWorm
//
//  Created by Robert Bates on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
    }
}

#Preview {
    ContentView()
}
