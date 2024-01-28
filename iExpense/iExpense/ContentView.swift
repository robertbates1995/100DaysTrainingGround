//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

class ContentModel {
    var expenses = Expenses()
    var showingAddExpense = false
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    model.showingAddExpense = true
                }
            }
            .sheet(isPresented: $model.showingAddExpense) {
                AddView(expenses: model.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        model.expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
