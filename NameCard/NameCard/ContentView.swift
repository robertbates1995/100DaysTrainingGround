//
//  ContentView.swift
//  NameCard
//
//  Created by Robert Bates on 5/18/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            //currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            //applyProcessing()
        }
    }
}

#Preview {
    ContentView()
}
