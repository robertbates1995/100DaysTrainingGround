//
//  ContentView.swift
//  Mile60
//
//  Created by Robert Bates on 4/15/24.
//

import SwiftUI

struct Response: Codable {
    var users = [User]()
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        List {
            ForEach(users) { user in
                Text(user.name)
            }
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
            
            let decodedResponse = try JSONDecoder().decode([User].self, from: data)
            users = decodedResponse
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
