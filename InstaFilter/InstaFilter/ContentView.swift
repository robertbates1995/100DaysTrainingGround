//
//  ContentView.swift
//  InstaFilter
//
//  Created by Robert Bates on 4/29/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
    }
}

#Preview {
    ContentView()
}
