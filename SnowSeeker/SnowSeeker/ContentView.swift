//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Robert Bates on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    ContentView()
}
