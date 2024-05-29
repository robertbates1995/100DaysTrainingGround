//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.scissors)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8, height: 300)
        }
    }
}

#Preview {
    ContentView()
}
