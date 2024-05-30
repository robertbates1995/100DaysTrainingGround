//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Robert Bates on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var layoutVertically = false

    var body: some View {
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
    }
    
    struct UserView: View {
        var body: some View {
            Group {
                Text("Name: Paul")
                Text("Country: England")
                Text("Pets: Luna and Arya")
            }
            .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
