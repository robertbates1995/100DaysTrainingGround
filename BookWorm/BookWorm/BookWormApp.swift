//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Robert Bates on 3/25/24.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
