//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ContentModel.self)
    }
}
