//
//  UserDetailView.swift
//  Mile60
//
//  Created by Robert Bates on 4/18/24.
//

import SwiftUI

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
        VStack {
            isActiveView
            Text(user.address)
            Text(user.email)
            Text("Age: \(user.age)")
            Text(user.company)
            Text(user.about)
                .padding()
        }
        .navigationTitle(user.name)
    }
}

#Preview {
    UserView(user: User(id: "Test ID", isActive: true, name: "Test Name", age: 100, company: "Test Company", email: "Test email", address: "Test address", about: "Test About section", registered: "Test regestration", tags: ["test tag 1", "test tag 2"], friends: [Friend(id: "test friend ID", name: "Test friend name")]))
}
