//
//  AddView.swift
//  iExpense
//
//  Created by Robert Bates on 1/27/24.
//

import SwiftUI

enum currencyType: String, CaseIterable {
    case USD = "USD"
    case EUR = "EUR"
    case GBP = "GBP"
}

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = currencyType.EUR
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                HStack {
                    TextField("Amount", value: $amount, format: .currency(code: currency.rawValue))
                        .keyboardType(.decimalPad)
                    Picker("Currency: ", selection: $currency) {
                        ForEach(currencyType.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
