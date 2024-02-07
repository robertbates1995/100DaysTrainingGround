//
//  ContentView.swift
//  Moonshot
//
//  Created by Robert Bates on 2/4/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
