//
//  ContentView.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection = Set<String>()
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("you selected: \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    ContentView()
}
