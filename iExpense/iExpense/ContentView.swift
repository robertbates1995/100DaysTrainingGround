//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ExpenseItem {
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
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
