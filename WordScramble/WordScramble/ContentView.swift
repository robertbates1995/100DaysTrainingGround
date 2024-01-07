//
//  ContentView.swift
//  WordScramble
//
//  Created by Robert Bates on 1/4/24.
//

import SwiftUI

class ContentModel {
    var usedWords = [String]()
    var rootWord = ""
    var newWord = ""
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
    }
    
    func testString() {
        let sut = "a\nb\nc"
        let letters = sut.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        List {
            Section {
                TextField("Enter your word", text: $model.newWord)
            }
        }
    }
}

#Preview {
    ContentView()
}
