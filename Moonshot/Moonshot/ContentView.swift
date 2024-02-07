//
//  ContentView.swift
//  Moonshot
//
//  Created by Robert Bates on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.fatSeal)
            .resizable()
            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
