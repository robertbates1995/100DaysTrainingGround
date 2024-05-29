//
//  ContentView.swift
//  DiceChallenge
//
//  Created by Robert Bates on 5/29/24.
//

import SwiftUI
import SwiftData

@Model
class Die: Identifiable {
    var id = UUID()
    var value = 0
    
    init(id: UUID = UUID(), value: Int = 0) {
        self.id = id
        self.value = value
    }
    
    func roll() {
        value = .random(in: 1..<7)
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var model: [Die]
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(model.first?.value.formatted() ?? "no value")
                Button("roll") {
                    model.first?.roll()
                }
                Button("Add Die") {
                    modelContext.insert(Die())
                }
            }
            .padding()
            .navigationTitle("Dice Roller")
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Die.self, configurations: config)

        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
