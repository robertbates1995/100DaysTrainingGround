//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI
import SwiftData

@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var model: [ExpenseItem]
    
    var body: some View {
        NavigationStack {
            List {
                if model.count > 0 {
                    Text("Personal")
                        .font(.largeTitle)
                }
                ForEach(model) { item in
                    var background: UIColor {
                        if item.amount < 10 { return .green }
                        if item.amount < 100 { return .yellow }
                        return .red
                    }
                    ZStack{
                        Color(background)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    }
                }
                .onDelete(perform: deleteExpense)
            }
        Text("test")
//            .navigationTitle($model.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("add expense", action: addExpense)
            }
        }
    }
    
    func addExpense() {
        modelContext.insert(ExpenseItem(name: "test name", type: "test type", amount: 20.00))
    }
    
    func deleteExpense(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(model[index])
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpenseItem.self, configurations: config)

        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
