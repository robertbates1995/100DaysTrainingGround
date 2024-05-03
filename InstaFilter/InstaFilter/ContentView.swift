//
//  ContentView.swift
//  InstaFilter
//
//  Created by Robert Bates on 4/29/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let example = Image(.paper)

        ShareLink(item: example, preview: SharePreview("Paper stack", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
