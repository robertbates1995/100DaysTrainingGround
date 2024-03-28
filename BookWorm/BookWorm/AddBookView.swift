//
//  AddBookView.swift
//  BookWorm
//
//  Created by Robert Bates on 3/28/24.
//

import SwiftUI

struct AddBookViewModel {
    var title = ""
    var author = ""
    var rating = 3
    var genre = "Fantasy"
    var review = ""
}

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @State var model = AddBookViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddBookView()
}
