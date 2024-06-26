//
//  UserDetailView.swift
//  Mile60
//
//  Created by Robert Bates on 4/18/24.
//

import SwiftUI
import SwiftData

struct UserView: View {
    @State var user: User
    
    var isActiveView: some View {
        if user.isActive {
            return Text("Online")
                .frame(maxWidth: 70)
                .bold()
                .colorInvert()
                .background(.green)
                .clipShape(.rect(cornerRadius: 10))
        }
        return Text("Offline")
            .frame(maxWidth: 70)
            .bold()
            .colorInvert()
            .background(.gray)
            .clipShape(.rect(cornerRadius: 10))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            isActiveView
            Text("\(user.company)")
                .font(.headline).italic()
            Text(user.address)
                .font(.subheadline)
            Text(user.email)
                .font(.subheadline)
            Text("\n\n    \(user.about)")
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        .navigationTitle(user.name)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    
    let user = User(id: "Test ID", isActive: true, name: "Test Name", age: 100, company: "Test Company", email: "Test email", address: "Test address", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "Test regestration", tags: ["test tag 1", "test tag 2"], friends: [Friend(id: "test friend ID", name: "Test friend name")])
    
    return UserView(user: user)
}
