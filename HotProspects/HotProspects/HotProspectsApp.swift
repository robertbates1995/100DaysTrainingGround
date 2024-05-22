//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Robert Bates on 5/21/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
