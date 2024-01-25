//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Bates on 1/22/24.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentModel {
    var user = User(firstName: "firstName", lastName: "lastName")
}

struct ContentView: View {
   @State var model = ContentModel()
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(model.user) {
                UserDefaults.standard.setValue(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ContentView()
}
