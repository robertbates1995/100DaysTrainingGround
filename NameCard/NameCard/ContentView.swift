//
//  ContentView.swift
//  NameCard
//
//  Created by Robert Bates on 5/18/24.
//

import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI

class User: Identifiable {
    let id = UUID()
    let photo: Image
    let name: String
    
    init(photo: Image, name: String) {
        self.photo = photo
        self.name = name
    }
}

struct ContentView: View {
    @State private var processedUsers: [User]?
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showPopover: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    if let processedUsers {
                        ForEach(processedUsers) { user in
                            UserTileView(user: user)
                        }
                    } else {
                        ContentUnavailableView("No Picture", image: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .popover(
                    isPresented: $showPopover,
                    arrowEdge: .bottom
                ) {
                    @State var temp: String = ""
                    
                    TextField(
                        "Name",
                        text: $temp
                    )
                    .onSubmit {
                        //save to new user tile
                    }
                    Button("Save") {
                        showPopover = false
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
            }
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            showPopover = true
            processedImage = Image(uiImage: inputImage)
        }
    }
}

#Preview {
    ContentView()
}
