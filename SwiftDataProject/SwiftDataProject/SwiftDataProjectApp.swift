//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Robert Bates on 4/3/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
