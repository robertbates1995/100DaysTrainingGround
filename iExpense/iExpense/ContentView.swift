//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI
import SwiftData

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Model
class Expenses {
    var personalItems = [ExpenseItem]()
    var businessItems = [ExpenseItem]()
    
    init(personalItems: [ExpenseItem] = [ExpenseItem](), businessItems: [ExpenseItem] = [ExpenseItem]()) {
        self.personalItems = personalItems
        self.businessItems = businessItems
    }
}

@Model
class ContentModel {
    @Relationship(deleteRule: .cascade) var expenses: Expenses? = Expenses()
    var showingAddExpense = false
    var title = "iExpense"
    
    init(showingAddExpense: Bool = false, title: String = "iExpense") {
        self.showingAddExpense = showingAddExpense
        self.title = title
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var model: ContentModel
    
    var body: some View {
        NavigationStack {
//            List {
//                if model.expenses.personalItems.count > 0 {
//                    Text("Personal")
//                        .font(.largeTitle)
//                }
//                ForEach(model.expenses.personalItems) { item in
//                    var background: UIColor {
//                        if item.amount < 10 { return .green }
//                        if item.amount < 100 { return .yellow }
//                        return .red
//                    }
//                    ZStack{
//                        Color(background)
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(item.name)
//                                    .font(.headline)
//                                Text(item.type)
//                            }
//                            Spacer()
//                            Text(item.amount, format: .currency(code: "USD"))
//                        }
//                    }
//                }
//                .onDelete(perform: removePersonalItems)
//                if model.expenses.businessItems.count > 0 {
//                    Text("Business")
//                        .font(.largeTitle)
//                }
//                ForEach(model.expenses.businessItems) { item in
//                    var background: UIColor {
//                        if item.amount < 10 { return .green }
//                        if item.amount < 100 { return .yellow }
//                        return .red
//                    }
//                    ZStack{
//                        Color(background)
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(item.name)
//                                    .font(.headline)
//                                Text(item.type)
//                            }
//                            Spacer()
//                            Text(item.amount, format: .currency(code: "USD"))
//                        }
//                    }
//                }
//                .onDelete(perform: removePersonalItems)
//            }
        Text("test")
            .navigationTitle($model.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    //AddView(expenses: model.expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
    
//    func removePersonalItems(at offsets: IndexSet) {
//        model.expenses.personalItems.remove(atOffsets: offsets)
//    }
//    func removeBusinessItems(at offsets: IndexSet) {
//        model.expenses.businessItems.remove(atOffsets: offsets)
//    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ContentModel.self, configurations: config)

        let model = ContentModel()
        return ContentView(model: model)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
