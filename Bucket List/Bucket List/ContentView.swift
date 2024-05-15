//
//  ContentView.swift
//  Bucket List
//
//  Created by Robert Bates on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    let users = [User(firstName: "First1", lastName: "Last1"),
                 User(firstName: "First2", lastName: "Last2"),
                 User(firstName: "First3", lastName: "Last3")
    ].sorted { $0.firstName > $1.lastName }
    
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.firstName
    }
}

#Preview {
    ContentView()
}
