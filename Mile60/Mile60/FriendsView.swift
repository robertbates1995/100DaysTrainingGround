//
//  FriendsView.swift
//  Mile60
//
//  Created by Robert Bates on 4/19/24.
//

import SwiftUI

struct FriendsView: View {
    @State var friends: [Friend]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FriendsView(friends: [Friend(id: "test ID 1", name: "Test name 1"), Friend(id: "test ID 2", name: "Test name 2"), Friend(id: "test ID 3", name: "Test name 3")])
}
