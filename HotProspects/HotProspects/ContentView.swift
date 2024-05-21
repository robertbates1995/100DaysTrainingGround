//
//  ContentView.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Send Message") {
                        print("hey")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
