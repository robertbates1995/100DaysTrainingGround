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
    var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedItems
            }
        }
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedItems
            }
        }
        personalItems = []
        businessItems = []
    }
}

@Observable
class ContentModel {
    var expenses = Expenses()
    var showingAddExpense = false
    var title = "iExpense"

}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            List {
                if model.expenses.personalItems.count > 0 {
                    Text("Personal")
                        .font(.largeTitle)
                }
                ForEach(model.expenses.personalItems) { item in
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
                .onDelete(perform: removePersonalItems)
                if model.expenses.businessItems.count > 0 {
                    Text("Business")
                        .font(.largeTitle)
                }
                ForEach(model.expenses.businessItems) { item in
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
                .onDelete(perform: removePersonalItems)
            }
            .navigationTitle($model.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddView(expenses: model.expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        model.expenses.personalItems.remove(atOffsets: offsets)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        model.expenses.businessItems.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
