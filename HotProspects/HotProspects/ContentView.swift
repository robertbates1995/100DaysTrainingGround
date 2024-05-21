//
//  ContentView.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection: String?
    
    var body: some View {
        List(users, id: \.self) { user in
            Text(user)
        }
        
        if let selection {
            Text("you selected: \(selection)")
        }
    }
}

#Preview {
    ContentView()
}
