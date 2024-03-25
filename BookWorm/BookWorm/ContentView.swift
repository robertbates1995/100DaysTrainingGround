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
            .toolbar {
                Button("Add") {
                    let firstNames = ["Sam", "Ben", "Mike", "James", "Jason"]
                    let lastNames = ["Smith", "Green", "Black", "Bates"]
                    
                    var firstName = firstNames.randomElement()!
                    var lastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(firstName) \(lastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
