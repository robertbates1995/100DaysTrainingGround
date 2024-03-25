//
//  ContentView.swift
//  BookWorm
//
//  Created by Robert Bates on 3/25/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
        }
    }
}

#Preview {
    ContentView()
}
