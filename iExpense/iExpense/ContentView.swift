//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct ContentModel {
    var numbers = [Int]()
    var currentNumber = 1
}

struct ContentView: View {
   @State var model = ContentModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(model.numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    model.numbers.append(model.currentNumber)
                    model.currentNumber += 1
                }
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        model.numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
