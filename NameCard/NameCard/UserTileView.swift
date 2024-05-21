//
//  UserTileView.swift
//  NameCard
//
//  Created by Robert Bates on 5/19/24.
//

import SwiftUI

struct UserTileView: View {
    @State var user: User
    
    var body: some View {
        user.photo
            .resizable()
            .scaledToFit()
        Text(user.name)
    }
}

#Preview {
    UserTileView(
        user: User(photo: Image("photo.badge.plus"), name: "Test Name"))
}
