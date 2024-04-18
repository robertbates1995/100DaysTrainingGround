//
//  UserDetailView.swift
//  Mile60
//
//  Created by Robert Bates on 4/18/24.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    
    var body: some View {
        VStack {
            HStack {
                user.isActive ? Text("Status: online") : Text("Status: offline")
                Spacer()
            }
            Spacer()
        }
        .navigationTitle(user.name)
    }
}

#Preview {
    UserView(user: User(id: "Test ID", isActive: false, name: "Test Name", age: 100, company: "Test Company", email: "Test email", address: "Test address", about: "Test About section", registered: "Test regestration", tags: ["test tag 1", "test tag 2"], friends: [Friend(id: "test friend ID", name: "Test friend name")]))
}
