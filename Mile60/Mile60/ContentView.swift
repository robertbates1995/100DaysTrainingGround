//
//  ContentView.swift
//  Mile60
//
//  Created by Robert Bates on 4/15/24.
//

import SwiftUI
import SwiftData

//struct Response: Codable {
//    var users = [User]()
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        print("body")
        return NavigationStack {
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
            try? modelContext.transaction {
                print("inserted")
                for i in decodedResponse {
                    modelContext.insert(i)
                }
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    let modelContext = container.mainContext
    modelContext.autosaveEnabled = false
    
    
    let user1 = User(id: "Test ID", isActive: true, name: "TEST NAME HERE", age: 100, company: "Test Company", email: "Test email", address: "Test address", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "Test regestration", tags: ["test tag 1", "test tag 2"], friends: [Friend(id: "test friend ID", name: "Test friend name")])
    
    //modelContext.insert(user1)
    return ContentView()
        .modelContainer(container)
}
