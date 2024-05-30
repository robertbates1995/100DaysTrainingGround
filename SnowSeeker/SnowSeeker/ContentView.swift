//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Robert Bates on 5/30/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    
    var body: some View {
        Button("Tap Me") {
            isShowingUser = true
        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) { }
        }
    }
}

#Preview {
    ContentView()
}
