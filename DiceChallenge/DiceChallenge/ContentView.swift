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
    @Query private var dice: [Die]
    
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(dice) { die in
                    Text(die.value.formatted())
                }
                HStack(alignment: .firstTextBaseline){
                    Spacer()
                    Button(action: { for i in dice {i.roll()} }) {
                        VStack {
                            Image(systemName: "dice")
                                .font(.title)
                            Text("roll")
                        }
                        .frame(width: 100, height: 80)
                        .background(.yellow)
                    }
                    Spacer()
                    Button(action: { modelContext.insert(Die()) }) {
                        VStack {
                            Image(systemName: "plus")
                                .font(.title)
                            Text("Add die")
                        }
                    }
                    .frame(width: 100, height: 80)
                    .background(.yellow)
                    Spacer()
                    Button(action: { if !dice.isEmpty {modelContext.delete(dice.last!)} }) {
                        VStack {
                            Image(systemName: "minus")
                                .font(.title)
                            Text("Remove die")
                        }
                    }
                    .frame(width: 100, height: 80)
                    .background(.yellow)
                    Spacer()
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
