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
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $model.title)
                    TextField("Name of Author", text: $model.author)
                    
                    Picker("Genre", selection: $model.genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    AddBookView()
}
