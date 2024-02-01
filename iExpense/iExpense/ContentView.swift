//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

@Observable
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
