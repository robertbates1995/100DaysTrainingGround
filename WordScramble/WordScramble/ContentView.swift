//
//  ContentView.swift
//  WordScramble
//
//  Created by Robert Bates on 1/4/24.
//

import SwiftUI

@Observable
class ContentModel {
    var usedWords = [String]()
    var rootWord = ""
    var newWord = ""
    
    var errorTitle = ""
    var errorMessage = ""
    var showingError = false
    
    init(usedWords: [String] = [String](), rootWord: String = "", newWord: String = "", errorTitle: String = "", errorMessage: String = "", showingError: Bool = false) {
        self.usedWords = usedWords
        self.rootWord = rootWord
        self.newWord = newWord
        self.errorTitle = errorTitle
        self.errorMessage = errorMessage
        self.showingError = showingError
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        guard isOriginal(word: answer) else {
            wordError(title: "word used already", message: "non-unique word entered.")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "\(answer) cannot be spelled using \(rootWord)")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "This word is not recognized as part of the english language")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startNewGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
            List {
                Section {
                    TextField("Enter your word", text: $model.newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(model.usedWords, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle(model.rootWord)
            .onAppear(perform: model.startNewGame)
            .onSubmit(model.addNewWord)
            .alert(model.errorTitle, isPresented: $model.showingError) { } message: {
                Text(model.errorMessage)
            }
        }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
