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
    @State private var processedUsers = [User]()
    @State private var processedImage: Image?
    @State private var userName: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showPopover: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(processedUsers) { user in
                        UserTileView(user: user)
                    }
                }
                PhotosPicker(selection: $selectedItem) {
                    if processedUsers.isEmpty {
                        ContentUnavailableView("No Picture", image: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .popover(
                    isPresented: $showPopover,
                    arrowEdge: .bottom
                ) {
                    TextField(
                        "Name",
                        text: $userName
                    )
                    .onSubmit {
                        if let processedImage {
                            processedUsers.append(User(photo: processedImage, name: userName))
                        }
                        showPopover = false
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                    PhotosPicker(selection: $selectedItem) {
                        Text("New Contact")
                    }
                    .popover(isPresented: $showPopover) {
                        TextField(
                            "Name",
                            text: $userName
                        )
                        .onSubmit {
                            if let processedImage {
                                processedUsers.append(User(photo: processedImage, name: userName))
                            }
                            showPopover = false
                        }
                    }
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
