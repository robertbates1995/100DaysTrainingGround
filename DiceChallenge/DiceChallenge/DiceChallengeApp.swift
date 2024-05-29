//
//  DiceChallengeApp.swift
//  DiceChallenge
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI
import SwiftData

@main
struct DiceChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Die.self)
    }
}
