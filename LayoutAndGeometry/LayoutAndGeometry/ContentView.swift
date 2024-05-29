//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@twoblades")
                Image(.scissors)
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("Scissors McCutter")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
