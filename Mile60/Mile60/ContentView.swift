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
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(user.name) {
                        UserView(user: user)
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
            .navigationTitle("Users")
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
