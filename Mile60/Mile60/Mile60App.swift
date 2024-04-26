//
//  Mile60App.swift
//  Mile60
//
//  Created by Robert Bates on 4/15/24.
//

import SwiftUI
import SwiftData

@main
struct Mile60App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
