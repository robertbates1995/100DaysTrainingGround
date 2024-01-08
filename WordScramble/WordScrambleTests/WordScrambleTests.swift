//
//  WordScrambleTests.swift
//  WordScrambleTests
//
//  Created by Robert Bates on 1/4/24.
//

import XCTest
@testable import WordScramble
import StateTesting

struct TestState: Equatable {
    var usedWords: [String]
    var rootWord: String
    var newWord: String
    var errorTitle: String
    var errorMessage: String
    var showingError: Bool
    
    init(_ model: ContentModel) {
        self.usedWords = model.usedWords
        self.rootWord = model.rootWord
        self.newWord = model.newWord
        self.errorTitle = model.errorTitle
        self.errorMessage = model.errorMessage
        self.showingError = model.showingError
    }
}

final class WordScrambleTests: XCTestCase {
    let sut = ContentModel()
    lazy var given = StateTester(given: {TestState(self.sut)})
    let testWord = "abetting"

    func testAddNewWordToEmptyArray() {
        sut.rootWord = testWord
        sut.newWord = testWord
        given.when({sut.addNewWord()}) {
            $0.change(\.usedWords, [testWord])
            $0.change(\.newWord, "")
        }
    }
    
    func testAddNewWordToPopulatedArray() {
        sut.usedWords = ["word1"]
        sut.rootWord = testWord
        sut.newWord = testWord
        given.when({sut.addNewWord()}) {
            $0.change(\.usedWords, ["abetting", "word1"])
            $0.change(\.newWord, "")
        }
    }
    
    func testAddRepeatedWord() {
        sut.usedWords = [testWord]
        sut.rootWord = testWord
        sut.newWord = testWord
        given.when({sut.addNewWord()}) {
            $0.change(\.errorTitle, "word used already")
            $0.change(\.errorMessage, "non-unique word entered.")
            $0.change(\.showingError, true)
        }        
    }
}
