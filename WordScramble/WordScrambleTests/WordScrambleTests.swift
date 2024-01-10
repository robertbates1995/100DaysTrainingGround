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
    var score: Int
    
    init(_ model: ContentModel) {
        self.usedWords = model.usedWords
        self.rootWord = model.rootWord
        self.newWord = model.newWord
        self.errorTitle = model.errorTitle
        self.errorMessage = model.errorMessage
        self.showingError = model.showingError
        self.score = model.score
    }
}

final class WordScrambleTests: XCTestCase {
    let sut = ContentModel()
    lazy var given = StateTester(given: {TestState(self.sut)})
    let testRoot = "dog"
    let testAnswer = "god"

    func testAddNewWordToEmptyArray() {
        sut.rootWord = testRoot
        sut.newWord = testAnswer
        given.when({sut.addNewWord()}) {
            $0.change(\.usedWords, [testAnswer])
            $0.change(\.newWord, "")
            $0.change(\.score, 1)
        }
    }
    
    func testAddNewWordToPopulatedArray() {
        sut.usedWords = ["word1"]
        sut.rootWord = testRoot
        sut.newWord = testAnswer
        given.when({sut.addNewWord()}) {
            $0.change(\.usedWords, [testAnswer, "word1"])
            $0.change(\.newWord, "")
            $0.change(\.score, 1)
        }
    }
    
    func testAddRootWord() {
        sut.rootWord = testRoot
        sut.newWord = testRoot
        given.when({sut.addNewWord()}) {
            $0.change(\.errorTitle, "word used already")
            $0.change(\.errorMessage, "non-unique word entered.")
            $0.change(\.showingError, true)
        }
    }
    
    func testAddRepeatedWord() {
        sut.usedWords = [testRoot]
        sut.rootWord = testRoot
        sut.newWord = testRoot
        given.when({sut.addNewWord()}) {
            $0.change(\.errorTitle, "word used already")
            $0.change(\.errorMessage, "non-unique word entered.")
            $0.change(\.showingError, true)
        }        
    }
}
